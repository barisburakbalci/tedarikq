import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: Colors.green,
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    elevation: 2,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    backgroundColor: Colors.greenAccent,
  ),
);
