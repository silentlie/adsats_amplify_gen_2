import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/confirm_dialog_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/models/new_documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/reminder_service.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/service.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/new_documents_details_form.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/reminder_form.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewDocumentView extends ConsumerStatefulWidget {
  const NewDocumentView({
    super.key,
    this.subcategory,
  });

  final Subcategory? subcategory;

  @override
  ConsumerState<NewDocumentView> createState() => _NewDocumentViewState();
}

class _NewDocumentViewState extends ConsumerState<NewDocumentView>
    with ConfirmDialogMixin {
  bool _isLoading = false;
  bool _initSuccess = false;
  final Map<String, double> _fileProgress = {};
  late NewDocumentsState _state;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userDetailsProvider).value;
    final subcategory = user == null ? null : _initialSubcategory(user);

    if (subcategory == null) {
      return;
    }

    _state = NewDocumentsState(
      uploader: user,
      subcategory: subcategory,
    );
    _initSuccess = true;
  }

  Subcategory? _initialSubcategory(Staff user) {
    if (widget.subcategory != null) {
      return widget.subcategory;
    }

    final subcategories = user.subcategories ?? const [];
    for (final staffSubcategory in subcategories) {
      final subcategory = staffSubcategory.subcategory;
      if (subcategory != null) {
        return subcategory;
      }
    }

    return null;
  }

  void _showLoading(bool value) {
    setState(() {
      _isLoading = value;
      if (!value) _fileProgress.clear(); // Reset progress when done
    });
  }

  void _updateState(NewDocumentsState value) {
    if (_isLoading) {
      return;
    }

    setState(() {
      _state = value;
    });
  }

  void _closeDialog() {
    if (context.canPop()) {
      context.pop();
    } else {
      DocumentsRoute().go(context);
    }
  }

  Future<void> _pickFiles() async {
    final filePickerResult = await FilePicker.pickFiles(
      allowMultiple: true,
      type: FileType.any,
      withData: false,
      // Ensure to get file stream for better performance
      withReadStream: true,
    );
    if (filePickerResult != null) {
      ref.read(selectedFilesProvider.notifier).addFiles(filePickerResult.files);
    }
  }

  Future<void> _cancel() async {
    final result = await showConfirmDialog(
      context: context,
      title: const Text("Are you sure?"),
      content: const Text("Do you want to cancel?"),
    );
    if (!result) {
      return;
    }
    if (!mounted) return;
    if (context.canPop()) {
      context.pop();
    } else {
      DocumentsRoute().go(context);
    }
  }

  Future<void> _uploadDocuments(NewDocumentsState state) async {
    final files = ref.read(selectedFilesProvider);
    final uploader = state.uploader;
    final subcategory = state.subcategory;

    if (files.isEmpty || uploader == null || subcategory == null) {
      return;
    }

    final reminderResult = state.reminderResult;
    final confirmation = await showConfirmDialog(
      context: context,
      title: const Text("Are you sure?"),
      content: Text(
        reminderResult == null
            ? "Do you want to upload these documents?"
            : "Do you want to upload these documents and create reminders?",
      ),
    );
    if (!confirmation) {
      return;
    }

    _showLoading(true);
    final documentsService = ref.read(documentsServiceProvider);
    final reminderService = ref.read(reminderServiceProvider);
    try {
      final documents = await documentsService.uploadBatch(
        files,
        uploader,
        subcategory,
        state.aircraft,
        state.archived,
        state.issuedAt,
        state.expiredAt,
        (fileName, progress) {
          setState(() {
            _fileProgress[fileName] = progress;
          });
        },
      );

      if (reminderResult != null) {
        await Future.wait([
          for (final document in documents)
            for (final date in reminderResult.dates)
              reminderService.createReminder(
                date: date,
                document: document,
                staff: reminderResult.staff,
              ),
        ]);
      }

      ref.invalidate(documentsProvider);
      ref.read(selectedFilesProvider.notifier).clearFiles();
      if (!mounted) return;
      if (context.canPop()) {
        context.pop();
      } else {
        DocumentsRoute().go(context);
      }
    } catch (e) {
      debugPrint('Error uploading files: $e');
    } finally {
      if (mounted) {
        _showLoading(false);
      }
    }
  }

  Widget _buildSelectedFiles(List<PlatformFile> selectedFiles) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: selectedFiles.map((file) {
          return PlaformFileWidget(
            file: file,
            onDelete: () {
              ref.read(selectedFilesProvider.notifier).removeFile(file);
              setState(() {
                _fileProgress.remove(file.name);
              });
            },
            progress: _fileProgress[file.name],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContent(List<PlatformFile> files) {
    switch (_state.stage) {
      case NewDocumentsStage.details:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NewDocumentsDetailsForm(
              state: _state,
              onChanged: _updateState,
            ),
            _buildSelectedFiles(files),
          ],
        );
      case NewDocumentsStage.reminders:
        return ReminderForm(
          state: _state.reminderState,
          onChanged: (value) {
            _updateState(_state.copyWith(reminderState: value));
          },
        );
    }
  }

  List<Widget> _buildActions() {
    final colorScheme = Theme.of(context).colorScheme;
    switch (_state.stage) {
      case NewDocumentsStage.details:
        return [
          ElevatedButton.icon(
            onPressed: _cancel,
            label: const Text('Cancel'),
            icon: const Icon(Icons.cancel_outlined),
          ),
          ElevatedButton.icon(
            onPressed: _pickFiles,
            label: const Text("Pick file"),
            icon: const Icon(Icons.note_add_outlined),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_state.isExpiryAvailable) {
                _updateState(
                  _state.copyWith(stage: NewDocumentsStage.reminders),
                );
                return;
              }
              _uploadDocuments(_state);
            },
            label: Text(_state.isExpiryAvailable ? 'Next' : 'Upload Files'),
            icon: Icon(
              _state.isExpiryAvailable
                  ? Icons.arrow_forward_outlined
                  : Icons.upload_file,
            ),
          ),
        ];
      case NewDocumentsStage.reminders:
        return [
          ElevatedButton.icon(
            onPressed: () {
              _updateState(
                _state.copyWith(stage: NewDocumentsStage.details),
              );
            },
            label: const Text('Back'),
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          ElevatedButton.icon(
            onPressed: () => _uploadDocuments(_state),
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(colorScheme.secondary),
            ),
            label: Text(
              'Upload Files',
              style: TextStyle(color: colorScheme.onSecondary),
            ),
            icon: Icon(
              Icons.upload_file,
              color: colorScheme.onSecondary,
            ),
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initSuccess) {
      return AlertDialog.adaptive(
        title: const Text('Unable to add documents'),
        content: const Text('No document subcategories are available.'),
        actions: [
          ElevatedButton.icon(
            onPressed: _closeDialog,
            icon: const Icon(Icons.error_outline),
            label: const Text('OK'),
          ),
        ],
      );
    }
    final selectedFiles = ref.watch(selectedFilesProvider);
    return Stack(
      children: [
        AlertDialog.adaptive(
          title: Text(
            'Add Documents',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content: SingleChildScrollView(
            child: _buildContent(selectedFiles),
          ),
          actions: _buildActions(),
        ),
        if (_isLoading)
          ModalBarrier(
            color: Colors.black.withValues(alpha: 0.5),
            dismissible: false,
          ),
        if (_isLoading)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

class PlaformFileWidget extends StatelessWidget {
  const PlaformFileWidget({
    super.key,
    required this.file,
    required this.onDelete,
    required this.progress,
  });

  final PlatformFile file;
  final VoidCallback onDelete;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(file.name),
                SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progress ?? 0.0,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
