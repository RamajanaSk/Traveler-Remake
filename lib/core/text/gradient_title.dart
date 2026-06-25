import 'package:flutter/material.dart';

class GradientTitle extends StatelessWidget {
  final String text;

  const GradientTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF6A3CFF), Color(0xFF3A7BFF), Color(0xFF2EE6E6)],
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 46,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }
}
