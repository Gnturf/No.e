import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    this.actions = const [],
    required this.label,
  });

  final String label;
  final Widget child;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const Spacer(),
            for (var i = 0; i < actions.length; i++) actions[i]
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Section body
        child,
      ],
    );
  }
}
