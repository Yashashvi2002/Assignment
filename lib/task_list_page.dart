
import 'package:assignment/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  final Function(Task) addTaskCallback;

  TaskListPage({Key? key, required this.addTaskCallback}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _addSampleTask();
  }

  void _loadTasks() async {
    FirebaseFirestore.instance.collection('tasks').snapshots().listen((snapshot) {
      List<Task> loadedTasks = snapshot.docs.map((doc) {
        return Task(
          title: doc['title'],
          description: doc['description'],
          completed: doc['completed'] ?? false,
        );
      }).toList();

      setState(() {
        tasks = loadedTasks;
      });
    });
  }

  void _addSampleTask() {
    setState(() {
      tasks.add(Task(
        title: 'Sample Task',
        description: 'This is a sample task description.',
        completed: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Checkbox(
              value: task.completed,
              onChanged: (bool? value) {
                setState(() {
                  task.completed = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}



