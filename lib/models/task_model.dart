import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final DateTime dateTime;
  Color color;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.color,
    this.isCompleted = false,
  });
}
