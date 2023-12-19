import 'package:flutter/material.dart';
import 'package:no_e/misc/icons/f_icons.dart';
import 'package:no_e/screens/task_input.dart';
import 'package:no_e/widgets/dashboard/profile_bar.dart';
import 'package:no_e/widgets/dashboard/project_task/project_task_container.dart';
import 'package:no_e/widgets/dashboard/quick_card/quick_card_list.dart';
import 'package:no_e/widgets/dashboard/section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FIcons.bell_regular,
            ),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const Column(
            children: [
              Text('data'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
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
              return TaskInputScreen(
                modalContext: ctx,
              );
            },
          );
        },
        child: const Icon(FIcons.feather_alt),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: ProfileBar(),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 0,
              child: Section(
                label: 'Here\'s Your Task Today',
                child: QuickCardList(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 2,
              child: Section(
                label: 'Your Task',
                child: ProjectTaskContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
