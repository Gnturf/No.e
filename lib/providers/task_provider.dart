import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/misc/dummy_data/dummy_data.dart';
import 'package:no_e/models/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super(taskDummy);

  void onComplete(Task task) {
    task.isFinished = true;
    task.finishedAt = DateTime.now();

    state = [...state];
  }

  void onAdd(Task task) {
    state = [...state, task];
  }
}

final activeTaskProvider = Provider((ref) {
  final tasks = ref.watch(taskProvider);
  var timeProv = DateTime.now();

  final taskList = tasks.where((task) {
    final difference = task.deadline.difference(timeProv);
    if (task.isFinished || difference.inDays < 0) {
      return false;
    }

    return true;
  }).toList();

  return taskList;
});

final completedTaskProvider = Provider((ref) {
  final tasks = ref.watch(taskProvider);

  final taskList = tasks.where((task) {
    if (task.isFinished) {
      return true;
    }

    return false;
  }).toList();

  return taskList;
});
