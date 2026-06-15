import 'package:flutter/material.dart';

class RandomQuestCard extends StatelessWidget {
  const RandomQuestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "RANDOM",
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
                    "QUEST",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  "Visit a street you've never visited before.",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                ),

                const SizedBox(height: 24),

                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF00D4FF).withValues(alpha: 0.25),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.casino_outlined,
                          size: 18,
                          color: Color(0xFF00D4FF),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Generate New Quest",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00D4FF),
                          ),
                        ),
                      ],
                    ),
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
