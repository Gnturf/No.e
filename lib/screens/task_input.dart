import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_e/models/task.dart';
import 'package:no_e/providers/task_provider.dart';

class TaskInputScreen extends ConsumerStatefulWidget {
  const TaskInputScreen({super.key, required this.modalContext});

  final BuildContext modalContext;

  @override
  ConsumerState<TaskInputScreen> createState() {
    return _TaskInputScreenState();
  }
}

class _TaskInputScreenState extends ConsumerState<TaskInputScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Safe Area
        Container(
          height: 10,
          width: double.infinity,
          decoration: const BoxDecoration(
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
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            bottom: 15,
            right: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) {
                    title = value!;
                  },
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                        ).fontFamily,
                      ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "e.g Create UI",
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontFamily: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                              ).fontFamily,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    print(newValue);
                  },
                  buildCounter: (
                    context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) {
                    return Text(
                      '$currentLength / $maxLength',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    );
                  },
                  maxLength: 300,
                  maxLines: null,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration.collapsed(
                    hintText: "Description e.g 3 elipsis",
                    hintStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                  ),
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
                        _formKey.currentState!.reset();
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
                        _formKey.currentState!.save();
                        var taskNotifier = ref.watch(taskProvider.notifier);
                        taskNotifier.onAdd(
                          Task(
                            title: title,
                            createdAt: DateTime.now(),
                            deadline: DateTime.now().add(
                              const Duration(days: 2),
                            ),
                          ),
                        );

                        _formKey.currentState!.reset();

                        Navigator.pop(widget.modalContext);
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
        ),
      ],
    );
  }
}
