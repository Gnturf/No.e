import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/providers/task_provider.dart';
import 'package:no_e/widgets/dashboard/project_task/project_task_body/project_task_body_item.dart';
import 'package:no_e/widgets/dashboard/project_task/project_task_head/project_task_head.dart';

class ProjectTaskContainer extends ConsumerWidget {
  const ProjectTaskContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTask = ref.watch(activeTaskProvider);
    final taskNotifier = ref.watch(taskProvider.notifier);

    return Expanded(
      child: Column(
        children: [
          const ProjectTaskHead(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: activeTask.length,
              itemBuilder: (ctx, index) {
                return ProjectTaskBodyItem(
                  task: activeTask[index],
                  onCompleted: () {
                    taskNotifier.onComplete(activeTask[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
