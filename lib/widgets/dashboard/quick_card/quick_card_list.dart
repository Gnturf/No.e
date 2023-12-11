import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/providers/task_provider.dart';
import 'package:no_e/widgets/dashboard/quick_card/quick_card.dart';
import 'package:no_e/widgets/dashboard/quick_card/quick_card_empty.dart';

class QuickCardList extends ConsumerStatefulWidget {
  const QuickCardList({super.key});

  @override
  ConsumerState<QuickCardList> createState() {
    return _QuickCardListState();
  }
}

class _QuickCardListState extends ConsumerState<QuickCardList> {
  @override
  Widget build(BuildContext context) {
    final activeTask = ref.watch(activeTaskProvider);
    final taskNotifier = ref.watch(taskProvider.notifier);

    Widget currWidget = const QuickCardEmpty();

    if (activeTask.isNotEmpty) {
      currWidget = Stack(
        children: [
          QuickCard(
            task: activeTask[0],
            onDelete: () {
              taskNotifier.onComplete(activeTask[0]);
            },
          ),
        ],
      );
    }

    return currWidget;
  }
}
