import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class DocumentsWidget extends StatelessWidget {
  const DocumentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(columns: DocumentsSource.columns, source: DocumentsSource());
  }
}

class DocumentsSource extends DataTableSource {
  static get columns {
    return <DataColumn>[
      const DataColumn(
        label: Text(
          "File name",
        ),
      ),
      const DataColumn(
        label: Text(
          "Aircraft",
        ),
      ),
      const DataColumn(
        label: Text(
          "Subcategory",
        ),
      ),
      const DataColumn(
        label: Text(
          "Category",
        ),
      ),
      const DataColumn(
        label: Text(
          "Archived",
        ),
      ),
      const DataColumn(
        label: Text(
          "Upload date",
        ),
      ),
      const DataColumn(
        label: Text(
          "Action",
        ),
      ),
    ];
  }

  List<Document> data = [];

  DocumentsSource();

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    final document = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(document.name)),
        DataCell(Text(document.subcategory?.name ?? "")),
        DataCell(Text(document.subcategory?.category?.name ?? "")),
        DataCell(Text(document.archived.toString())),
        DataCell(Text(document.createdAt.toString())),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        )),
      ],
    );
  }



  Future<void> fetchRawData() async {
    const graphQLDocument = '''
      query ListDocuments(\$filter: ModelDocumentFilterInput) {
        listDocuments(filter: \$filter) {
          items {
            id
            name
            subcategory {
              id
              name
              category {
                id
                name
              }
            }
            createdAt
            archived
          }
        }
      }
    ''';

    // Example subcategory IDs
    List<String> subcategoryIds = ["1", "2", "3"]; // Dynamic input

    // Generate the filter
    Map<String, dynamic> filter = createDynamicFilter(subcategoryIds);

    final request = GraphQLRequest<String>(
      document: graphQLDocument,
      variables: {"filter": filter},
    );

    final response = await Amplify.API.query(request: request).response;
    print(response.data);
  }

  // Function to generate a dynamic filter based on a list of subcategory IDs
  Map<String, dynamic> createDynamicFilter(List<String> subcategoryIds) {
    if (subcategoryIds.isEmpty) {
      return {}; // Return an empty filter if no subcategory IDs are provided
    }

    // Create the 'or' filter with multiple 'eq' conditions for subcategoryId
    List<Map<String, dynamic>> orConditions = subcategoryIds.map((id) {
      return {
        "subcategoryId": {"eq": id}
      };
    }).toList();

    return {"or": orConditions};
  }
}
