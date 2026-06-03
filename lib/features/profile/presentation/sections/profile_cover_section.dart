import 'package:flutter/material.dart';
import 'package:travelerremake/features/profile/constants/profile_strings.dart';
import 'package:travelerremake/features/profile/styles/profile_styles.dart';

class ProfileCoverSection extends StatelessWidget {
  final String username;

  const ProfileCoverSection({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: ProfileStyles.coverDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: ProfileStyles.titleStyle),

          const SizedBox(height: 8),

          const Text(
            ProfileStrings.subtitle,
            style: ProfileStyles.subtitleStyle,
          ),
        ],
      ),
    );
  }
}
