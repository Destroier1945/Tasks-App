import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
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
              value: ThemeMode,
              groupValue: ThemeMode.system,
              onChanged: (value) {},
              title: Text('Sistema'),
            ),
            RadioListTile(
              value: ThemeMode,
              groupValue: ThemeMode.light,
              onChanged: (value) {},
              title: Text('Claro'),
            ),
            RadioListTile(
              value: ThemeMode,
              groupValue: ThemeMode.dark,
              onChanged: (value) {},
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
