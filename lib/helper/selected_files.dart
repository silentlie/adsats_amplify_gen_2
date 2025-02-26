import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_files.g.dart';

@Riverpod(dependencies: [])
class SelectedFiles extends _$SelectedFiles {
  @override
  List<PlatformFile> build() {
    return [];
  }

  void addFiles(List<PlatformFile> files) {
    state = [...state, ...files];
  }

  void removeFile(PlatformFile file) {
    state.remove(file);
    state = state.where((item) => item != file).toList();
  }

  void clearFiles() {
    state = [];
  }
}
