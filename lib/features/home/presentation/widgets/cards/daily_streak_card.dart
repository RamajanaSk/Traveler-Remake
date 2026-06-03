import 'package:flutter/material.dart';

class DailyStreakCard extends StatelessWidget {
  const DailyStreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🔥 DAILY STREAK",
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),

            const SizedBox(height: 12),

            const Text(
              "14 Days",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "You explored the world every day this week.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            const LinearProgressIndicator(value: 14 / 30),
          ],
        ),
      ),
    );
  }
}
