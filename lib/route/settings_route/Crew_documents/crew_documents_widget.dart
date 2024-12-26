import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
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

  Future<(List<Aircraft>, List<Role>, List<CrewDocumentsCategory>)>
      fetchCrewDocumentsMeta() async {
    try {
      final request = GraphQLRequest<String>(
        document: listCrewDocumentsMeta,
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
          (jsonMap["listCrewDocumentsCategories"]["items"] as List)
              .map((item) => CrewDocumentsCategory.fromJson(item))
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
  final List<CrewDocumentsCategory> categories;
  @override
  State<CrewDocumentsContent> createState() => _CrewDocumentsContentState();
}

class _CrewDocumentsContentState extends State<CrewDocumentsContent>
    with TickerProviderStateMixin {
  late List<Aircraft> aircraft;
  late List<Role> roles;
  late List<CrewDocumentsCategory> categories;

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
                              (role) => Placeholder(),
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
