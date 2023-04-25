import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/shared/theme/themes.dart';
import 'package:todoapp/viewmodels/task_view_model.dart';
import 'package:todoapp/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _selectedTheme = ThemeMode.system;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadThemePreferences();
  }

  Future<void> _loadThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString =
        prefs.getString('theme_mode') ?? ThemeMode.system.toString();
    setState(() {
      _selectedTheme = ThemeMode.values.firstWhere(
          (element) => element.toString() == themeModeString,
          orElse: () => ThemeMode.system);
    });
  }

  Future<void> _saveThemePreferences(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', themeMode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO APP',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _selectedTheme,
        home: HomePage(
          saveTheme: _saveThemePreferences,
        ),
      ),
    );
  }
}
