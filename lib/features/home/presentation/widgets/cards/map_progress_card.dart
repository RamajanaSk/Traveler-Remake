import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/traveler_card.dart';

class MapProgressCard extends StatelessWidget {
  const MapProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelerCard(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WORLD",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),

                const SizedBox(height: 4),

                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
                  ).createShader(bounds),
                  child: const Text(
                    "PROGRESS",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "12%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Map unlocked",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 20),

                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: 0.12,
                    minHeight: 8,
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF00D4FF)),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
