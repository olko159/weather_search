import 'package:flutter/material.dart';

final darkAppTheme = ThemeData(
  backgroundColor: Colors.black,
  primaryColor: Colors.deepPurpleAccent,
  secondaryHeaderColor: Colors.greenAccent,
  textTheme: TextTheme(
    headline3: const TextStyle().copyWith(
        color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 24.0),
    headline2: const TextStyle().copyWith(
        color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 18.0),
  ),
);

final lightAppTheme = ThemeData(
  backgroundColor: Colors.white,
  primaryColor: Colors.greenAccent,
  secondaryHeaderColor: Colors.deepPurpleAccent,
  textTheme: TextTheme(
    headline3: const TextStyle().copyWith(
        color: Colors.deepPurpleAccent,
        fontWeight: FontWeight.bold,
        fontSize: 24.0),
    headline2: const TextStyle().copyWith(
        color: Colors.deepPurpleAccent,
        fontWeight: FontWeight.bold,
        fontSize: 18.0),
  ),
);
