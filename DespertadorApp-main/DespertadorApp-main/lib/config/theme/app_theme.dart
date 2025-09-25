

import 'package:flutter/material.dart';


class AppTheme {

  static ThemeData getTheme({ required bool isDarkMode }) => ThemeData(

    colorSchemeSeed: Colors.blue,
    brightness: isDarkMode ? Brightness.dark : Brightness.light

  );

}