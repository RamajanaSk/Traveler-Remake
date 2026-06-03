import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_colors.dart';

class ProfileStyles {
  static BoxDecoration coverDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.startGradientColor,
        AppColors.middleGradientColor,
        AppColors.endGradientColor,
      ],
    ),
  );

  static const titleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static const subtitleStyle = TextStyle(fontSize: 16, color: Colors.white70);
}
