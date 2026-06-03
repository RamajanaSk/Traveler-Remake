import 'package:flutter/material.dart';

class ProfileStatItem extends StatelessWidget {
  final String label;
  final int value;

  const ProfileStatItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
