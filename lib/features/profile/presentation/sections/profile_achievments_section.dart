import 'package:flutter/material.dart';

class ProfileAchievementSection extends StatelessWidget {
  const ProfileAchievementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Achievements', style: Theme.of(context).textTheme.titleLarge),

        const SizedBox(height: 12),

        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _AchievementCard(icon: Icons.flight_takeoff, title: 'First Trip'),
              _AchievementCard(icon: Icons.public, title: 'Explorer'),
              _AchievementCard(icon: Icons.people, title: 'Socializer'),
            ],
          ),
        ),
      ],
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _AchievementCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
