import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/providers/task_provider.dart';
import 'package:no_e/widgets/dashboard/drawer/drawer_tile.dart';

class DrawerSection extends ConsumerWidget {
  const DrawerSection({
    super.key,
    required this.label,
    required this.onClicked,
    required this.children,
  });

  final String label;
  final Function() onClicked;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTask = ref.watch(activeTaskProvider).length;
    final completeTask = ref.watch(completedTaskProvider).length;
    final missedTask = ref.watch(missedTaskProvider).length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Head
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onClicked,
              child: const Icon(
                Icons.add,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          width: double.maxFinite,
          child: Column(
            children: [
              DrawerTile(
                label: 'Active',
                ammount: activeTask,
              ),
              DrawerTile(
                label: 'Finished',
                ammount: completeTask,
              ),
              DrawerTile(
                label: 'Missed',
                ammount: missedTask,
              ),
            ],
          ),
        )
      ],
    );
  }
}
