import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_e/misc/icons/f_icons.dart';

class FormButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        FIcons.clock,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 0.5,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 6,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      label: Text(
        "Due Date",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontFamily: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
              ).fontFamily,
            ),
      ),
    );
  }
}
