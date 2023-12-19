import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:no_e/models/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final dayFormatted = intl.DateFormat('d').format(task.deadline);
    final monthFormatted = intl.DateFormat('MMM').format(task.deadline);
    final timeFormatted = intl.DateFormat('jm').format(task.deadline);

    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: 450,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              task.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '$dayFormatted $monthFormatted ${task.deadline.year} | $timeFormatted',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ).fontFamily,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              task.desc,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
