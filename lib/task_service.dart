import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_model.dart';

class TaskService {
  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(Task task) {
    return taskCollection.add(task.toMap());
  }

  Stream<List<Task>> getTasks(String userId) {
    return taskCollection
        .where('sharedWith', arrayContains: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Task.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList());
  }

  Future<void> updateTask(String taskId, Map<String, dynamic> updates) {
    return taskCollection.doc(taskId).update(updates);
  }

  Future<void> deleteTask(String taskId) {
    return taskCollection.doc(taskId).delete();
  }
}
