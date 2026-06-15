import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/presentation/widgets/stat_item.dart';

class UserStatsCard extends StatelessWidget {
  const UserStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatItem("523", "Buildings"),
          StatItem("182", "Roads"),
          StatItem("941", "Trees"),
        ],
      ),
    );
  }
}
