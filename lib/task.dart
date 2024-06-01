// import 'package:cloud_firestore/cloud_firestore.dart';
//
class Task {
  final String title;
  final String description;
  bool completed;

  Task({
    required this.title,
    required this.description,
    this.completed = false,
  });
}
