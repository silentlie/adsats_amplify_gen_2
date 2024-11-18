import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/s3.dart';
import 'package:adsats_amplify_gen_2/route/training_route/filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrainingWidget extends StatelessWidget {
  const TrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: const Card(
          child: DocumentsView(),
        ),
      ),
    );
  }
}

class DocumentsView extends StatefulWidget {
  const DocumentsView({super.key});

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  bool isInitialize = false;
  @override
  Widget build(BuildContext context) {
    Map<Category, List<Subcategory>> map = {};
    Provider.of<AuthNotifier>(context).user.subcategories?.forEach(
      (staffSubcategory) {
        if (map[staffSubcategory.subcategory!.category!] == null) {
          map[staffSubcategory.subcategory!.category!] = [];
        }
        map[staffSubcategory.subcategory!.category!]!
            .add(staffSubcategory.subcategory!);
      },
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Documents",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...map.entries.map(
            (entry) {
              return ExpansionTile(
                leading: Icon(Icons.view_agenda_outlined),
                title: Text(entry.key.name),
                enabled: !entry.key.archived,
                children: entry.value.map(
                  (subcategory) {
                    return ExpansionTile(
                      leading: Icon(Icons.view_list_outlined),
                      title: Text(subcategory.name),
                      enabled: !subcategory.archived,
                      children: [DocumentsViewWidget(subcategory: subcategory)],
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DocumentsViewWidget extends StatefulWidget {
  const DocumentsViewWidget({super.key, required this.subcategory});
  final Subcategory subcategory;

  @override
  State<DocumentsViewWidget> createState() => _DocumentsViewWidgetState();
}

class _DocumentsViewWidgetState extends State<DocumentsViewWidget> {
  late final Filter filter;

  @override
  void initState() {
    filter = Filter(subcategory: widget.subcategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchDocuments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: snapshot.data!.map(
              (document) {
                return ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text(document.name),
                  trailing: getActions(context, document),
                  subtitle: Text([
                    document.archived ? "Archived" : "Active",
                    DateFormat('dd/MM/yyyy').format(
                      document.createdAt!.getDateTimeInUtc(),
                    ),
                    if (document.staff != null) document.staff!.name,
                    ...document.aircraft!.map(
                      (e) => e.aircraft!.name,
                    ),
                  ].join(" - ")),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Placeholder();
                    },
                  ),
                );
              },
            ).toList(),
          );
        }
      },
    );
  }

  Future<List<Document>> fetchDocuments() async {
    try {
      final request = GraphQLRequest<String>(
        document: listDocuments,
        variables: {"filter": filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      return (jsonMap["listDocuments"]["items"] as List).map(
        (document) {
          return Document.fromJson(document);
        },
      ).toList();
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Document failed: $e');
      return [];
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Document failed: $e');
      return [];
    }
  }

  Widget getActions(BuildContext context, Document document) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(
      context,
      listen: false,
    );
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getFileUrl(document);
          },
          icon: const Icon(Icons.download_outlined),
          tooltip: "Download",
        ),
        if (authNotifier.isAdmin || authNotifier.isEditor)
          IconButton(
            onPressed: () async {
              await archive(document);
              setState(() {});
            },
            icon: const Icon(Icons.archive_outlined),
            tooltip: "Archive",
          ),
        if (authNotifier.isAdmin)
          IconButton(
            onPressed: () async {
              await delete(document);
              setState(() {});
            },
            icon: const Icon(Icons.delete_outline),
            tooltip: "Delete",
          ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_vert,
            // size: 20,
          ),
        );
      },
    );
  }
}
