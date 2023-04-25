import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/views/add_task_page.dart';
import 'package:todoapp/views/configuration_page.dart';
import 'package:todoapp/views/task_list_page.dart';

class HomePage extends StatelessWidget {
  final Function(ThemeMode) saveTheme;
  const HomePage({Key? key, required this.saveTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => ConfigurationPage(
                  saveTheme: (ThemeMode themeMode) => saveTheme(themeMode),
                ),
              ),
            );
          }
        },
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: const Text('Opções'),
          ),
          NavigationDrawerDestination(
              icon: Icon(Icons.sync), label: Text('Sincronizar')),
          NavigationDrawerDestination(
              icon: Icon(Icons.settings), label: Text('Configurações'))
        ],
      ),
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: TaskListPage(),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'fab1',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AddTaskPage(),
            ),
          );
        },
        label: const Text('adicionar'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
