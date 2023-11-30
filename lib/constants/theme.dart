import 'package:flutter/material.dart';

class UniversityStudentsTheme {
  static ThemeData get themeData {
    return ThemeData(
      // Primary color for the app
      primaryColor: Colors.indigo,

      // Accent color for highlighting elements
      hintColor: Colors.amber,

      // Scaffold background color
      scaffoldBackgroundColor: Colors.white,

      // AppBar theme
      appBarTheme: AppBarTheme(
        color: Colors.indigo,
      ),

      // Text theme
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),

      // Button theme
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.indigo,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),

      // Input decoration theme for form fields
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.indigo),
        ),
      ),

      // Card theme
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),

      // Icon theme
      iconTheme: IconThemeData(color: Colors.indigo),
    );
  }
}
