import 'dart:ui';
import 'package:flutter/material.dart';

/* The `Colors` class provides a set of predefined color constants used throughout the application.
 It includes color values for various UI elements, such as backgrounds, fonts, buttons, etc.
*/

class AppColors {
  Color ne = Color.fromRGBO(49, 150, 254, 1);
  Color doch = Color.fromRGBO(182, 32, 228, 1);
  Color logoPurple = Color.fromRGBO(104, 87, 252, 1);
  Color logoRed = Color.fromRGBO(246, 81, 101, 1);

  Color background = Color.fromARGB(255, 255, 255, 255);
  Color backgroundCard = Colors.white;

  Color white = Colors.white;
  Color black = const Color.fromARGB(255, 0, 0, 0);

  Color cardShadow = Color.fromARGB(255, 145, 143, 143);

  Color warningRed = Color.fromARGB(255, 255, 66, 66);

  Color textfieldGrey = Color.fromARGB(255, 53, 53, 53);
  Color textfieldWhite = const Color.fromARGB(255, 237, 237, 237);

  Color logoBlueOpacity = Color.fromRGBO(49, 150, 254, 1).withOpacity(0.5);
  Color logoLightPurpleOpacity = Color.fromRGBO(
    182,
    32,
    228,
    1,
  ).withOpacity(0.5);
  Color logoPurpleOpacity = Color.fromRGBO(104, 87, 252, 1).withOpacity(0.5);
  Color logoRedOpacity = Color.fromRGBO(246, 81, 101, 1).withOpacity(0.5);

  static const Color startGradientColor = Color(0xFF6A11CB);
  static const Color middleGradientColor = Color(0xFF2575FC);
  static const Color endGradientColor = Color(0xFF00D4FF);

  static const purple = Color(0xFF6A3CFF);
  static const blue = Color(0xFF3A7BFF);
  static const cyan = Color(0xFF2EE6E6);

  static const primary = Color(0xFF6A3CFF);
  static const secondary = Color(0xFF3A7BFF);

  static const LinearGradient travelerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [purple, blue, cyan],
  );
}
