import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/traveler_card.dart';

class MapProgressCard extends StatelessWidget {
  const MapProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "WORLD PROGRESS",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "12%",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text("Map unlocked", style: TextStyle(color: Colors.white70)),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(value: 0.12, minHeight: 10),
          ),
        ],
      ),
    );
  }
}
