import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/viewmodels/task_view_model.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: Consumer<TaskListViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task = viewModel.tasks[index];
              return Card(
                color: task.color,
                child: ListTile(
                  title: Text(task.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.description),
                      Text(
                        '${task.dateTime.day}/${task.dateTime.month}/${task.dateTime.year} ${task.dateTime.hour}:${task.dateTime.minute}',
                      ),
                    ],
                  ),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      viewModel.toggleTaskCompletion(index);
                    },
                  ),
                  onTap: () {
                    _showColorDialog(context, viewModel, index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void _showColorDialog(
      BuildContext context, TaskListViewModel viewModel, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Selecione um cor'),
            content: SingleChildScrollView(
                child: BlockPicker(
              pickerColor: viewModel.tasks[index].color,
              onColorChanged: (color) {
                viewModel.updateTaskColor(index, color);
              },
            )),
          );
        });
  }
}
