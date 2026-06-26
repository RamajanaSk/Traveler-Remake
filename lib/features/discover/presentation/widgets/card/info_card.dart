import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String value;
  final String label;

  const InfoCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: iconColor ?? Colors.white, size: 22),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(.6))),
      ],
    );
  }
}
