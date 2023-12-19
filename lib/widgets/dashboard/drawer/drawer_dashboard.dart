import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_e/screens/task_input.dart';
import 'package:no_e/widgets/dashboard/drawer/drawer_section.dart';

class DrawerDashboard extends StatelessWidget {
  const DrawerDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'No.e',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                ).fontFamily,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          DrawerSection(
            label: 'Task',
            onClicked: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                context: context,
                builder: (ctx) {
                  return TaskInputScreen(modalContext: ctx);
                },
              );
            },
            children: [],
          )
        ],
      ),
    );
  }
}
