import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';

class TaskListViewModel extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      title: 'Comprar leite',
      description: 'Comprar 1L de leite desnatado',
      dateTime: DateTime.now(),
      color: Colors.blue,
    ),
    Task(
      title: 'Ir ao médico',
      description: 'Consulta marcada com Dr. João',
      dateTime: DateTime.now().add(Duration(days: 1)),
      color: Colors.green,
    ),
    Task(
      title: 'Estudar Flutter',
      description: 'Aprender a criar apps em Flutter',
      dateTime: DateTime.now().add(Duration(days: 2)),
      color: Colors.yellow,
      isCompleted: true,
    ),
  ];

  List<Task> get tasks => _tasks;

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void updateTaskColor(int index, Color color) {
    _tasks[index].color = color;
    notifyListeners();
  }
}
