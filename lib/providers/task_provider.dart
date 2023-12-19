import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/misc/dummy_data/dummy_data.dart';
import 'package:no_e/models/task.dart';
import 'package:no_e/providers/time_provider.dart';

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

  taskList.sort((a, b) {
    return a.deadline.compareTo(b.deadline);
  });

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

final missedTaskProvider = Provider((ref) {
  final tasks = ref.watch(taskProvider);
  final time = ref.watch(timeProvider);

  final taskList = tasks.where((task) {
    if (!task.isFinished && task.deadline.compareTo(time.currTime) < 0) {
      return true;
    }

    return false;
  }).toList();

  return taskList;
});
