import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_colors.dart';

class TopNavBarDecoration {
  static BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.startGradientColor,
          AppColors.middleGradientColor,
          AppColors.endGradientColor,
        ],
      ),

      border: Border(
        bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
      ),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 2,
    );
  }
}
