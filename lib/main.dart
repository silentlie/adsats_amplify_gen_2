import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'amplify_outputs.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    setPathUrlStrategy();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugins([
      AmplifyAuthCognito(),
      AmplifyAPI(
        options: APIPluginOptions(
          modelProvider: ModelProvider.instance,
        ),
      ),
    ]);
    await Amplify.configure(amplifyConfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: const SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                SignOutButton(),
                Expanded(child: TodoScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _refreshTodos();
  }

  Future<void> _refreshTodos() async {
    try {
      final request = ModelQueries.list(Todo.classType);
      final response = await Amplify.API.query(request: request).response;

      final todos = response.data?.items;
      if (response.hasErrors) {
        safePrint('errors: ${response.errors}');
        return;
      }
      setState(() {
        _todos = todos!.whereType<Todo>().toList();
      });
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Random Todo'),
        onPressed: () async {
          final newTodo = Todo(
            id: uuid(),
            content: "Random Todo ${DateTime.now().toIso8601String()}",
            isDone: false,
          );
          final request = ModelMutations.create(newTodo);
          final response = await Amplify.API.mutate(request: request).response;
          if (response.hasErrors) {
            safePrint('Creating Todo failed.');
          } else {
            safePrint('Creating Todo successful.');
          }
          _refreshTodos();
        },
      ),
      body: _todos.isEmpty == true
          ? const Center(
              child: Text(
                "The list is empty.\nAdd some items by clicking the floating action button.",
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return Dismissible(
                  key: UniqueKey(),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      final request = ModelMutations.delete(todo);
                      final response =
                          await Amplify.API.mutate(request: request).response;
                      if (response.hasErrors) {
                        safePrint('Updating Todo failed. ${response.errors}');
                      } else {
                        safePrint('Updating Todo successful.');
                        await _refreshTodos();
                        return true;
                      }
                    }
                    return false;
                  },
                  child: CheckboxListTile.adaptive(
                    value: todo.isDone,
                    title: Text(todo.content!),
                    onChanged: (isChecked) async {
                      final request = ModelMutations.update(
                        todo.copyWith(isDone: isChecked!),
                      );
                      final response =
                          await Amplify.API.mutate(request: request).response;
                      if (response.hasErrors) {
                        safePrint('Updating Todo failed. ${response.errors}');
                      } else {
                        safePrint('Updating Todo successful.');
                        await _refreshTodos();
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
