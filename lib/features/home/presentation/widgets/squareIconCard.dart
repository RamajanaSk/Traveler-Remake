import 'package:flutter/material.dart';

class SquareIconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color iconColor;

  const SquareIconCard({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Icon(icon, size: 30, color: iconColor)),
        ),

        const SizedBox(height: 8),

        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
