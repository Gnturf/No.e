import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_e/misc/icons/f_icons.dart';
import 'package:no_e/widgets/task_input/due_date/due_date.dart';
import 'package:no_e/widgets/task_input/task_form_button.dart';

class TaskInputButtonList extends StatefulWidget {
  const TaskInputButtonList({
    super.key,
    required this.onSelectedDate,
  });

  final Function(DateTime date) onSelectedDate;

  @override
  State<StatefulWidget> createState() {
    return _TaskInputButtonListState();
  }
}

class _TaskInputButtonListState extends State<TaskInputButtonList> {
  DateTime? selectedDate;

  String formattedDueDate(DateTime date) {
    return DateFormat('yMMMd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(1),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TaskFormButton(
            label: selectedDate == null
                ? 'Due Date'
                : formattedDueDate(selectedDate!),
            icon: FIcons.calendar_outlined,
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
                  return DueDate(
                    onSelectedDate: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                      widget.onSelectedDate(date);
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          TaskFormButton(
            label: 'Priority',
            icon: FIcons.flag,
            onClicked: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          TaskFormButton(
            label: 'Ungrouped',
            icon: FIcons.list_ul,
            onClicked: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          TaskFormButton(
            label: 'Repeat',
            icon: FIcons.repeat_solid,
            onClicked: () {},
          ),
        ],
      ),
    );
  }
}
