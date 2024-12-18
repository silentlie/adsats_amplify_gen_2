import 'package:flutter/material.dart';

class CrewDocumentsWidget extends StatefulWidget {
  const CrewDocumentsWidget({super.key});

  @override
  State<CrewDocumentsWidget> createState() => _CrewDocumentsWidgetState();
}

class _CrewDocumentsWidgetState extends State<CrewDocumentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CrewDocumentsContent extends StatefulWidget {
  const CrewDocumentsContent({super.key});

  @override
  State<CrewDocumentsContent> createState() => _CrewDocumentsContentState();
}

class _CrewDocumentsContentState extends State<CrewDocumentsContent> {
  Future<void> getData() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Placeholder();
        }
      },
    );
  }
}
