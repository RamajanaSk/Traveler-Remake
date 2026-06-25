import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_colors.dart';

class LineDivider extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Gradient? gradient;

  const LineDivider({
    super.key,
    this.width = 100,
    this.height = 3,
    this.borderRadius,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        gradient: gradient ?? AppColors.travelerGradient,
      ),
    );
  }
}
