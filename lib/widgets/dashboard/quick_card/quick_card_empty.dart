import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:no_e/screens/task_input.dart';

class QuickCardEmpty extends StatelessWidget {
  const QuickCardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final deadlineDimension = TextPainter(
      text: TextSpan(
        text: '',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final titleDimension = TextPainter(
      text: TextSpan(
        text: '',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final projectDimension = TextPainter(
      text: TextSpan(
        text: '',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    const buttonDimension = 48;

    return DottedBorder(
      color: Theme.of(context).colorScheme.primaryContainer,
      dashPattern: [6, 3],
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              useSafeArea: true,
              context: context,
              builder: (ctx) {
                return TaskInputScreen(
                  modalContext: ctx,
                );
              },
            );
          },
          child: Container(
            color: Theme.of(context).colorScheme.background,
            width: double.infinity,
            height: deadlineDimension.height +
                15 +
                titleDimension.height +
                projectDimension.height +
                buttonDimension +
                30,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'You\'ve got no task currently',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                ),
                Text(
                  'Maybe add another one? :)',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
