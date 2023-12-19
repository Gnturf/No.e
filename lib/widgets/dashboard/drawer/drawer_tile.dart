import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.label,
    required this.ammount,
  });

  final String label;
  final int ammount;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.transparent,
          child: Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                    ),
              ),
              Spacer(),
              Text(
                '$ammount',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
