import 'package:flutter/material.dart';

class StatisticsSection extends StatelessWidget {
  final DateTime selectedDate;
  final Map<String, dynamic> statistics;

  const StatisticsSection({
    super.key,
    required this.selectedDate,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final steps = statistics['steps'] ?? 0;
    final distance = statistics['distance'] ?? 0.0;
    final locations = statistics['locations'] ?? 0;
    final travelTime = statistics['travelTime'] ?? 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Statistics', style: theme.textTheme.headlineSmall),

            const SizedBox(height: 8),

            Text(
              '${selectedDate.day}.${selectedDate.month}.${selectedDate.year}',
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.directions_walk,
                    title: 'Steps',
                    value: steps.toString(),
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.route,
                    title: 'Distance',
                    value: '${distance.toStringAsFixed(1)} km',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.place,
                    title: 'Places',
                    value: locations.toString(),
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.schedule,
                    title: 'Travel Time',
                    value: '$travelTime min',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _StatItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Icon(icon, size: 28),

            const SizedBox(height: 8),

            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(title),
          ],
        ),
      ),
    );
  }
}
