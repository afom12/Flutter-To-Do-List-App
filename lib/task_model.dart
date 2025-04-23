// task_model.dart - Task Data Model

class Task {
  String id;
  String title;
  String category;
  String priority;
  DateTime dueDate;
  bool completed;
  List<String> sharedWith;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.priority,
    required this.dueDate,
    required this.completed,
    required this.sharedWith,
  });

  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      priority: data['priority'] ?? 'Medium',
      dueDate: DateTime.parse(data['dueDate'] ?? DateTime.now().toIso8601String()),
      completed: data['completed'] ?? false,
      sharedWith: List<String>.from(data['sharedWith'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'priority': priority,
      'dueDate': dueDate.toIso8601String(),
      'completed': completed,
      'sharedWith': sharedWith,
    };
  }
}
