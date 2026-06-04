import 'dart:ui';
import 'package:flutter/material.dart';

class AppBackgroundGradient extends StatelessWidget {
  final Widget child;

  const AppBackgroundGradient({super.key, required this.child});

  Widget _blob({
    required double size,
    required Color color,
    required double top,
    required double left,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _blob(
          size: 420,
          color: const Color.fromARGB(255, 53, 53, 53).withValues(alpha: 0.6),
          top: -180,
          left: -180,
        ),

        _blob(
          size: 350,
          color: const Color.fromARGB(255, 10, 210, 255).withValues(alpha: 0.5),
          top: 100,
          left: 220,
        ),

        _blob(
          size: 320,
          color: const Color.fromARGB(255, 0, 174, 255).withValues(alpha: 0.3),
          top: 550,
          left: -100,
        ),

        _blob(
          size: 280,
          color: const Color.fromARGB(
            255,
            64,
            220,
            255,
          ).withValues(alpha: 0.12),
          top: 900,
          left: 180,
        ),

        _blob(
          size: 250,
          color: const Color(0xFF00FF88).withValues(alpha: 0.14),
          top: 1300,
          left: -50,
        ),

        child,
      ],
    );
  }
}
