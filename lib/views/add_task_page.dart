import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todoapp/widgets/bloc_picker_widget.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _decriptionController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;
  late final ValueNotifier<Color> _colorNotififer;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _decriptionController = TextEditingController();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    _colorNotififer = ValueNotifier<Color>(Colors.blue);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _decriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();

    _colorNotififer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<TimeOfDay?> pickTime(
        BuildContext context, TimeOfDay initialTime) async {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: initialTime,
      );
      return pickedTime;
    }

    Future<DateTime?> pickDate(
        BuildContext context, DateTime initialDate) async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
      return pickedDate;
    }

    Future<Color?> _pickColor(BuildContext context) async {
      final color = await showDialog<Color>(
        context: context,
        builder: (BuildContext context) {
          var _selectedColor;
          return AlertDialog(
            title: const Text('Selecione uma cor'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: _selectedColor ?? Colors.blue,
                onColorChanged: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCELAR'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(_selectedColor);
                },
              ),
            ],
          );
        },
      );

      return color;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nova tarefa'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: 'Titulo', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _decriptionController,
              decoration: InputDecoration(
                hintText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final pickedDate = await pickDate(context, DateTime.now());
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _timeController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () async {
                    final pickedTime = await pickTime(context, TimeOfDay.now());
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<Color>(
              valueListenable: _colorNotififer,
              builder: (context, color, _) => Row(
                children: [
                  const Text('Color: '),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _pickColor() {}
}
