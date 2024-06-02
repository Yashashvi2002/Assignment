class Task {
  final String title;
  final String description;
  bool completed;
  final String id;
  final DateTime dueDate; // Add dueDate

  Task({
    required this.title,
    required this.description,
    this.completed = false,
    required this.id,
    required this.dueDate, // Initialize dueDate
  });
}

