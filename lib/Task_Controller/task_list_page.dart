import 'package:assignment/Task_Controller/task.dart';
import 'package:assignment/Task_Controller/task_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Contains all the code about extracting data/task from Firestore database
class TaskListPage extends StatefulWidget {
  final Function(Task) addTaskCallback;

  const TaskListPage({
    super.key,
    required this.addTaskCallback,
  });

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();

  }

  void _loadTasks() async {
    FirebaseFirestore.instance.collection('tasks').snapshots().listen((snapshot) {
      List<Task> loadedTasks = snapshot.docs.map((doc) {
        return Task(
          title: doc['title'],
          description: doc['description'],
          completed: doc['completed'] ?? false,
          id: doc.id,
          dueDate: DateTime.parse(doc['dueDate']), // Parse dueDate
        );
      }).toList();

      setState(() {
        tasks = loadedTasks;
        _sortTasksByDueDate(); // Sort tasks by due date
      });
    });
  }


  void _sortTasksByDueDate() {
    tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate)); // Sort by due date
  }

  int getTotalTasks() {
    return tasks.length;
  }

  int getCompletedTasks() {
    return tasks.where((task) => task.completed).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                Task task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.description),
                      Text('Due: ${DateFormat.yMMMd().add_jm().format(task.dueDate.toLocal())}'), // Display due date in Jun 8, 2024 5:08 PM format
                    ],
                  ),
                  trailing: Checkbox(
                    value: task.completed,
                    onChanged: (bool? value) {
                      setState(() {
                        task.completed = value ?? false;
                        FirebaseFirestore.instance.collection('tasks').doc(task.id).update({'completed': task.completed});
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: TaskContainer(      //can be removed if not required
        totalTasks: getTotalTasks(),
        completedTasks: getCompletedTasks(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}