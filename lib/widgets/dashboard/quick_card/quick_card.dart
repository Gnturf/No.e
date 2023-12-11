import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/models/task.dart';
import 'package:no_e/providers/time_provider.dart';

class QuickCard extends ConsumerWidget {
  const QuickCard({super.key, required this.task, required this.onDelete});

  final Task task;
  final Function() onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeData = ref.watch(timeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.getDeadlineString(timeData.currTime).toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            task.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          Text(
            'Final Project',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              onPressed: onDelete,
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}
