import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_e/screens/dashboard.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(94, 119, 225, 1),
          primary: const Color.fromRGBO(0, 0, 0, 0.60),
          primaryContainer: const Color.fromRGBO(94, 119, 225, 1),
          onPrimaryContainer: const Color.fromRGBO(255, 255, 255, 1),
          secondary: const Color.fromRGBO(0, 0, 0, 0.50),
          tertiary: const Color.fromRGBO(0, 0, 0, 0.40),
          background: const Color.fromRGBO(250, 250, 250, 1),
          onBackground: Colors.black,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ).fontFamily,
            fontSize: 26,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ).fontFamily,
            fontSize: 20,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ).fontFamily,
            fontSize: 16,
            color: Colors.black,
          ),
          labelLarge: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontSize: 14,
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontSize: 12,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
