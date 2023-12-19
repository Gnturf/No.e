import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

class InstantDateButton extends StatelessWidget {
  const InstantDateButton({
    super.key,
    required this.label,
    required this.icon,
    required this.date,
    required this.onSelected,
    this.isSelected = false,
  });

  final String label;
  final IconData icon;
  final DateTime date;
  final bool isSelected;
  final Function(DateTime date) onSelected;

  @override
  Widget build(BuildContext context) {
    final labelDimension = TextPainter(
      text: TextSpan(
        text: label,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final dateDimension = TextPainter(
      text: TextSpan(
        text: label,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return Material(
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          onSelected(date);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: labelDimension.height + dateDimension.height + 30 + 5 + 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 30,
                color: isSelected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontFamily: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                      ).fontFamily,
                      color: isSelected
                          ? Colors.black
                          : Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              Text(
                intl.DateFormat('EEEE').format(date),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: isSelected
                          ? Colors.black
                          : Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
