import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class ConfigurationPage extends StatefulWidget {
  Future<void> Function(ThemeMode) saveTheme;

  ConfigurationPage({Key? key, required this.saveTheme});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

ThemeMode _selectTheme = ThemeMode.system;
Future<void> saveTheme(ThemeMode themeMode) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('theme_mode', themeMode.toString());
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Selecione o tema',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 30),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: _selectTheme,
              onChanged: (value) {
                setState(() {
                  _selectTheme = value as ThemeMode;
                  widget.saveTheme(_selectTheme);
                });
              },
              title: Text('Sistema'),
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: _selectTheme,
              onChanged: (value) {
                setState(() {
                  _selectTheme = value as ThemeMode;
                  widget.saveTheme(_selectTheme);
                });
              },
              title: Text('Claro'),
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: _selectTheme,
              onChanged: (value) {
                setState(() {
                  _selectTheme = value as ThemeMode;
                  widget.saveTheme(_selectTheme);
                });
              },
              title: Text('Escuro'),
            ),
            SizedBox(height: 30),
            Container(
              height: 46,
              width: 220,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Apagar cache',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
