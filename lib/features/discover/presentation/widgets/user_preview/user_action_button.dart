import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/button/app_action_button.dart';

class UserActionButtons extends StatelessWidget {
  const UserActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppActionButton(
            text: "Add Friend",
            icon: Icons.person_add_alt_1,
            filled: true,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: AppActionButton(
            text: "View Profile",
            icon: Icons.person_outline,
            filled: false,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
