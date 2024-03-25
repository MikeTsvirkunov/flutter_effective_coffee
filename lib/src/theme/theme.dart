import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      onBackground: Color(0xffF7FAF8),
      surface: Color(0xffF7FAF8),
      seedColor: Color(0xffF7FAF8),
      background: Color(0xffF7FAF8),
      primary: Color(0xffF7FAF8)),
  cardTheme: const CardTheme(color: Colors.white),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 32,
      fontFamily: 'Roboto',
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Roboto',
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Roboto',
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Roboto',
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 12,
      fontFamily: 'Roboto',
    ),
  ),
);
