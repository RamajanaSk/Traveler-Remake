import 'package:flutter/material.dart';
import 'package:travelerremake/features/profile/presentation/widgets/profile_stat_item.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Row(
          children: const [
            Expanded(child: ProfileStatItem(label: 'Friends', value: 100)),
            Expanded(child: ProfileStatItem(label: 'Following', value: 50)),
            Expanded(child: ProfileStatItem(label: 'Countries', value: 12)),
          ],
        ),
      ),
    );
  }
}
