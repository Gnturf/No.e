import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:no_e/misc/icons/f_icons.dart';
import 'package:no_e/providers/time_provider.dart';
import 'package:no_e/providers/user_provider.dart';

class ProfileBar extends ConsumerWidget {
  const ProfileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userProvider);
    final timeData = ref.watch(timeProvider);

    print(userData.profileURL);

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
          radius: 22,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: userData.profileURL == null
                  ? const Icon(
                      FIcons.circle_user_solid,
                      size: 40,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    )
                  : Image.network(
                      userData.profileURL!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // If you wanna vertical height of a column take all space available use IntrinsicHeight
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hey! Good ${timeData.stringifyTime}, ${userData.firstName}',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w500)
                              .fontFamily,
                    ),
              ),
              Text(
                '${timeData.customDay} / ${timeData.customMonth} / ${timeData.customYear}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
