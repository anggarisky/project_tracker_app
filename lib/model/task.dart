import 'package:flutter/material.dart';

class Task {
  String title;
  String status;
  String deadline;
  String cover;
  String person;

  Task({
    required this.title,
    required this.status,
    required this.deadline,
    required this.cover,
    required this.person,
  });
}
