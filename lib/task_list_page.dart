// import 'package:assignment_1/task_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  String title;
  String description;
  bool completed;
  DateTime? dueDate;

  Task({
    required this.title,
    required this.description,
    this.completed = false,
    this.dueDate,
  });
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task(
      title: 'Implement Navigation',
      description: 'Set up navigation for your app using Navigator or routes.',
      dueDate: DateTime.parse('2024-06-01T00:00:00Z'),
    ),
    Task(
      title: 'Design UI',
      description: 'Create wireframes and high-fidelity mockups for the app.',
    ),
    Task(
      title: 'Write Unit Tests',
      description: 'Write unit tests for the app\'s core functionality.',
      dueDate: DateTime.parse('2024-05-30T00:00:00Z'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _sortTasksByDueDate();
  }

  void _sortTasksByDueDate() {
    tasks.sort((a, b) {
      if (a.dueDate == null && b.dueDate == null) return 0;
      if (a.dueDate == null) return 1;
      if (b.dueDate == null) return -1;
      return a.dueDate!.compareTo(b.dueDate!);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].completed = !tasks[index].completed;
      _sortTasksByDueDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.description),
                if (task.dueDate != null)
                  Text('Due: ${DateFormat.yMMMd().format(task.dueDate!)}'),
              ],
            ),
            trailing: Checkbox(
              value: task.completed,
              onChanged: (bool? value) {
                _toggleTaskCompletion(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasks.add(Task(
              title: 'New Task ${tasks.length + 1}',
              description: 'Description for new task ${tasks.length + 1}',
            ));
            _sortTasksByDueDate();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
//code change kiya hai

// class TaskListPage extends StatefulWidget {
//   @override
//   _TaskListPageState createState() => _TaskListPageState();
// }
//
// class _TaskListPageState extends State<TaskListPage> {
//   // final TaskService _taskService = TaskService();
//   List<Map<String, dynamic>> _tasks = [];
//
//   @override
//   void initState() {
//     // super.initState();
//     // _loadTasks();
//   }
//
//   // void _loadTasks() async {
//   //   final tasks = await _taskService.fetchTasks();
//   //   setState(() {
//   //     _tasks = tasks;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Task List'),
//       ),
//       body: ListView.builder(
//         itemCount: _tasks.length,
//         itemBuilder: (context, index) {
//           final task = _tasks[index];
//           return ListTile(
//             title: Text(task['title'] ?? 'No Title'),
//             subtitle: Text(task['description'] ?? 'No Description'),
//             trailing: Text(task['completed'] ? 'Completed' : 'Pending'),
//           );
//         },
//       ),
//     );
//   }
// }




