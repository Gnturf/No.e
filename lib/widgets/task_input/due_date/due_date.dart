import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:no_e/misc/icons/f_icons.dart';
import 'package:no_e/providers/time_provider.dart';
import 'package:no_e/widgets/task_input/due_date/instant_date_button.dart';

class DueDate extends ConsumerStatefulWidget {
  const DueDate({
    super.key,
    required this.onSelectedDate,
  });

  final Function(DateTime date) onSelectedDate;

  @override
  ConsumerState<DueDate> createState() {
    return _DueDateState();
  }
}

class _DueDateState extends ConsumerState<DueDate> {
  @override
  void initState() {
    super.initState();
    var timeProv = ref.read(timeProvider);
    selectedDate = timeProv.endOfTheDayTime;
  }

  late DateTime selectedDate;
  int selectedButton = 1;

  String formattedDate(DateTime date) {
    var stringDays = intl.DateFormat('E').format(date);
    var stringMonth = intl.DateFormat('MMMM').format(date);

    var formattedDate = "$stringDays, ${date.day} $stringMonth ${date.year}";

    return formattedDate;
  }

  String formattedTime(DateTime date) {
    var stringHour = date.hour;
    var stringMinute = date.minute;
    var periodization = date.hour > 12 && date.hour < 24 ? "P.M" : "A.M";

    var formattedDate = "$stringHour : $stringMinute $periodization";

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    var timeProv = ref.watch(timeProvider);
    const day = "Sample Text";

    final textDimension = TextPainter(
      text: TextSpan(
        text: day,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Safe Area
          Container(
            height: 10,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Container(
                height: 3,
                width: 100,
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      formattedDate(selectedDate),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                    ),
                    Container(
                      height: textDimension.height,
                      width: 1.5,
                      color: Colors.black.withOpacity(0.2),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                    ),
                    Text(
                      formattedTime(selectedDate),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                    ),
                  ],
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.secondary,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InstantDateButton(
                      label: "Today",
                      icon: FIcons.calendar_day,
                      date: timeProv.endOfTheDayTime,
                      isSelected: selectedButton == 1,
                      onSelected: (date) {
                        setState(() {
                          selectedDate = date;
                          selectedButton = 1;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InstantDateButton(
                      label: "Tomorrow",
                      icon: FIcons.calendar_day,
                      date: timeProv.tomorrowTime,
                      isSelected: selectedButton == 2,
                      onSelected: (date) {
                        setState(() {
                          selectedDate = date;
                          selectedButton = 2;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InstantDateButton(
                      label: "Next Week",
                      icon: FIcons.calendar_day,
                      date: timeProv.nextWeekTime,
                      isSelected: selectedButton == 3,
                      onSelected: (date) {
                        setState(() {
                          selectedDate = date;
                          selectedButton = 3;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.secondary,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        widget.onSelectedDate(selectedDate);
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        'Save',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
