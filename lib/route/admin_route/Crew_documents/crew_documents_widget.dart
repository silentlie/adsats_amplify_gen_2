import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/admin_route/Crew_documents/documents_view_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class CrewDocumentsWidget extends StatelessWidget {
  const CrewDocumentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: FutureBuilder(
            future: fetchCrewDocumentsMeta(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final (aircraft, roles, categories) = snapshot.data!;
                return CrewDocumentsContent(
                  aircraft: aircraft,
                  roles: roles,
                  categories: categories,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<(List<Aircraft>, List<Role>, List<CrewDocumentCategory>)>
      fetchCrewDocumentsMeta() async {
    try {
      final request = GraphQLRequest<String>(
        document: listCrewDocumentMeta,
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final aircraft = (jsonMap["listAircraft"]["items"] as List)
          .map((item) => Aircraft.fromJson(item))
          .toList();
      final roles = (jsonMap["listRoles"]["items"] as List)
          .map((item) => Role.fromJson(item))
          .toList();
      final categories =
          (jsonMap["listCrewDocumentCategories"]["items"] as List)
              .map((item) => CrewDocumentCategory.fromJson(item))
              .toList();
      return (aircraft, roles, categories);
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchCrewDocumentsMeta failed: $e');
      rethrow;
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchCrewDocumentsMeta failed: $e');
      rethrow;
    }
  }
}

class CrewDocumentsContent extends StatefulWidget {
  const CrewDocumentsContent({
    super.key,
    required this.aircraft,
    required this.roles,
    required this.categories,
  });
  final List<Aircraft> aircraft;
  final List<Role> roles;
  final List<CrewDocumentCategory> categories;
  @override
  State<CrewDocumentsContent> createState() => _CrewDocumentsContentState();
}

class _CrewDocumentsContentState extends State<CrewDocumentsContent>
    with TickerProviderStateMixin {
  late List<Aircraft> aircraft;
  late List<Role> roles;
  late List<CrewDocumentCategory> categories;

  late TabController _aircraftTabCon;
  late TabController _rolesTabCon;

  @override
  void initState() {
    super.initState();
    aircraft = widget.aircraft;
    roles = widget.roles;
    categories = widget.categories;
    _aircraftTabCon = TabController(vsync: this, length: aircraft.length);
    _rolesTabCon = TabController(vsync: this, length: roles.length);
  }

  @override
  void dispose() {
    _aircraftTabCon.dispose();
    _rolesTabCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
          title: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Placeholder();
                },
              );
            },
            label: const Text('Crew document categories'),
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ),
        TabBar(
          controller: _aircraftTabCon,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: aircraft
              .map(
                (e) => Tab(
                  text: e.name,
                  icon: Icon(Icons.airplanemode_on_outlined),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _aircraftTabCon,
            children: aircraft.map(
              (aircraft) {
                return Column(
                  children: [
                    TabBar(
                      controller: _rolesTabCon,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      tabs: roles
                          .map(
                            (e) => Tab(
                              text: e.name,
                              icon: Icon(Icons.groups_2_outlined),
                            ),
                          )
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _rolesTabCon,
                        children: roles
                            .map(
                              (role) => CrewsView(
                                aircraft: aircraft,
                                role: role,
                                categories: categories,
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class CrewsView extends StatefulWidget {
  const CrewsView({
    super.key,
    required this.aircraft,
    required this.role,
    required this.categories,
  });

  final Aircraft aircraft;
  final Role role;
  final List<CrewDocumentCategory> categories;

  @override
  State<CrewsView> createState() => _CrewsViewState();
}

class _CrewsViewState extends State<CrewsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCrewDocumentsCrews(widget.aircraft, widget.role),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: snapshot.data!.map(
                (staff) {
                  return ExpansionTile(
                    title: Text(staff.name),
                    leading: Icon(Icons.person_outline),
                    children: widget.categories.map(
                      (category) {
                        return ExpansionTile(
                          title: Text(category.name),
                          leading: Icon(Icons.category_outlined),
                          children: [
                            DocumentsViewWidget(
                                staff: staff, category: category)
                          ],
                        );
                      },
                    ).toList(),
                  );
                },
              ).toList(),
            ),
          );
        }
      },
    );
  }

  Future<Iterable<Staff>> fetchCrewDocumentsCrews(
      Aircraft aircraft, Role role) async {
    try {
      final request =
          GraphQLRequest<String>(document: listCrewDocumentCrews, variables: {
        "aircraftId": aircraft.id,
        "roleId": role.id,
      });
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final staff = (jsonMap["getRole"]["staff"]["items"] as List)
          .map((e) => Staff.fromJson(e["staff"]))
          .where((element) => element.aircraft?.isNotEmpty ?? false);
      return staff;
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchCrewDocumentsMeta failed: $e');
      rethrow;
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchCrewDocumentsMeta failed: $e');
      rethrow;
    }
  }
}
