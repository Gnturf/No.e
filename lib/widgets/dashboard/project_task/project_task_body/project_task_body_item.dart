import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_e/misc/icons/f_icons.dart';
import 'package:no_e/models/task.dart';
import 'package:no_e/providers/time_provider.dart';

class ProjectTaskBodyItem extends ConsumerWidget {
  const ProjectTaskBodyItem({
    super.key,
    required this.task,
    required this.onCompleted,
  });

  final Task task;
  final Function() onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeData = ref.watch(timeProvider);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: onCompleted,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black45,
                    width: 0.4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.check,
                size: 10,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            task.title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontFamily: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500,
                  ).fontFamily,
                ),
          ),
          const Spacer(),
          Text(
            task.getDeadlineString(timeData.currTime),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontFamily: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500,
                  ).fontFamily,
                ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            FIcons.ellipsis_h,
            size: 12,
          ),
        ],
      ),
    );
  }
}
