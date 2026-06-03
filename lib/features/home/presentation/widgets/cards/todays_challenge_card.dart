import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/traveler_card.dart';

class TodaysChallengeCard extends StatelessWidget {
  const TodaysChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.flag_outlined, color: Color(0xFF00D4FF)),

              SizedBox(width: 8),

              Text(
                "TODAY'S CHALLENGE",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            "Walk 750m away from your current location.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "+25 XP • Unlock 1 new map tile",
            style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
          ),
        ],
      ),
    );
  }
}
