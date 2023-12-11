import 'package:flutter/material.dart';

class ProjectTaskHeadItem extends StatelessWidget {
  const ProjectTaskHeadItem({
    super.key,
    required this.label,
    this.isLast = false,
  });

  final String label;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final textDimension = TextPainter(
      text: TextSpan(
        text: label,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return Container(
      margin: EdgeInsets.only(right: isLast ? 0 : 20),
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: textDimension.width,
            height: 2,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
