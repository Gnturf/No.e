import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/providers/task_provider.dart';
import 'package:no_e/widgets/dashboard/project_task/project_task_head/project_task_head_item.dart';

class ProjectTaskHead extends ConsumerWidget {
  const ProjectTaskHead({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);
    final completedTask = ref.watch(completedTaskProvider);

    return Expanded(
      flex: 0,
      child: Row(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProjectTaskHeadItem(
                    label: 'All',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 0,
            child: Text(
              '${completedTask.length} / ${task.length} Done',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
