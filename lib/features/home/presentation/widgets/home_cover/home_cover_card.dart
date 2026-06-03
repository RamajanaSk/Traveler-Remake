import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/home_cover/home_cover_title.dart';

class HomeCoverCard extends StatelessWidget {
  const HomeCoverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 10, 11, 13),
            Color(0xFF111827),
            Color.fromARGB(255, 38, 86, 131),
          ],
        ),

        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: Colors.white.withValues(alpha: 0.08),
            ),
            child: const Text(
              "TODAY'S REMINDER",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 18),

          const HomeCoverTitle(),

          const SizedBox(height: 12),

          const Text(
            "The best stories rarely happen on the couch.",
            style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white.withValues(alpha: 0.08),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.explore_outlined, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  "Go somewhere you haven't been before.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
