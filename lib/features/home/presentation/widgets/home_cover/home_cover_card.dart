import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/home_cover/home_cover_item.dart';

class HomeCoverCard extends StatelessWidget {
  final HomeCoverItem item;

  const HomeCoverCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1,
                  ),
                ),

                const SizedBox(height: 4),

                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
                  ).createShader(bounds),
                  child: Text(
                    item.titleBelow,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
