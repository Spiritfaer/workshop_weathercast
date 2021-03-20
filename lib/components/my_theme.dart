import 'package:flutter/material.dart';

ThemeData myTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
