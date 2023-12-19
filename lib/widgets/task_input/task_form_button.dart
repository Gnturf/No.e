import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskFormButton extends StatelessWidget {
  const TaskFormButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onClicked,
  });

  final String label;
  final IconData icon;
  final Function() onClicked;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: InkWell(
        splashColor: Colors.amber,
        borderRadius: BorderRadius.circular(7),
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 0.5,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                      ).fontFamily,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
    // return TextButton.icon(
    //   onPressed: () {},
    //   icon: Icon(
    //     icon,
    //     size: 16,
    //     color: Theme.of(context).colorScheme.secondary,
    //   ),
    //   style: TextButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     side: BorderSide(
    //       color: Theme.of(context).colorScheme.secondary,
    //       width: 0.5,
    //       strokeAlign: BorderSide.strokeAlignCenter,
    //     ),
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 5,
    //       vertical: 7,
    //     ),
    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     minimumSize: Size.zero,
    //   ),
    //   label: Text(
    //     label,
    //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
    //           color: Theme.of(context).colorScheme.secondary,
    //           fontFamily: GoogleFonts.openSans(
    //             fontWeight: FontWeight.w600,
    //           ).fontFamily,
    //         ),
    //   ),
    // );
  }
}
