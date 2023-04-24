import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/shared/theme/themes.dart';
import 'package:todoapp/viewmodels/task_view_model.dart';
import 'package:todoapp/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO APP',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: HomePage(),
      ),
    );
  }
}
