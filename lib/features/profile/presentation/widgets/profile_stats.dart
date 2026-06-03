import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final int friends;
  final int following;

  const ProfileStats({
    super.key,
    required this.friends,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatItem(label: "Friends", value: friends),
        ),
        Expanded(
          child: _StatItem(label: "Following", value: following),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
