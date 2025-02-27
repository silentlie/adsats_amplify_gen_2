import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/crew_documents_route/documents_view_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  static String path = '/profile';

  @override
  Widget build(BuildContext context) {
    Staff user = Provider.of<AuthNotifier>(context).user;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: FutureBuilder(
            future: fetchCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListTile(
                        // contentPadding: const EdgeInsets.only(),
                        leading: const Text(
                          "Crew Documents",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // title: ElevatedButton.icon(
                        //   onPressed: () {
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return Placeholder();
                        //       },
                        //     );
                        //   },
                        //   label: const Text('Crew document categories'),
                        //   icon: const Icon(
                        //     Icons.add,
                        //     size: 25,
                        //   ),
                        // ),
                      ),
                      ...snapshot.data!.map(
                        (category) {
                          return ExpansionTile(
                            title: Text(category.name),
                            children: [
                              DocumentsViewWidget(
                                staff: user,
                                category: category,
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Iterable<CrewDocumentCategory>> fetchCategories() async {
    try {
      final request = GraphQLRequest<String>(
        document: listCrewDocumentCategories,
        variables: {"filter": {}},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      return (jsonMap["listCrewDocumentCategories"]["items"] as List).map(
        (category) {
          return CrewDocumentCategory.fromJson(category);
        },
      );
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Document failed: $e');
      return [];
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Document failed: $e');
      return [];
    }
  }
}
