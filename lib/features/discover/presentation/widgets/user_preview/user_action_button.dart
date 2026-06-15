import 'package:flutter/material.dart';

class UserActionButtons extends StatelessWidget {
  const UserActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1),
            label: const Text("Add Friend"),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.person_outline),
            label: const Text("View Profile"),
          ),
        ),
      ],
    );
  }
}
