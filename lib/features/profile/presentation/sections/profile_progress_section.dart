import 'package:flutter/material.dart';

class ProfileProgressSection extends StatelessWidget {
  const ProfileProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travel Progress',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            const _ProgressItem(city: 'Stuttgart', progress: 0.9),

            const _ProgressItem(city: 'Berlin', progress: 0.6),

            const _ProgressItem(city: 'Munich', progress: 0.4),
          ],
        ),
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String city;
  final double progress;

  const _ProgressItem({required this.city, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(city),

          const SizedBox(height: 6),

          LinearProgressIndicator(
            value: progress,
            borderRadius: BorderRadius.circular(20),
          ),
        ],
      ),
    );
  }
}
