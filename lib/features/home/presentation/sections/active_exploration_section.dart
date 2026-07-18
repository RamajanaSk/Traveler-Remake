import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/active_exploration_card.dart';

class ActiveExplorationSection extends StatelessWidget {
  const ActiveExplorationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2028),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "ACTIVE EXPLORATION",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),

          SizedBox(height: 18),

          ActiveExplorationTile(
            title: "City Explorer",
            subtitle: "127 discovered",
            icon: Icons.apartment_rounded,
            color: Color(0xFF4DA3FF),
            progress: .55,
          ),

          SizedBox(height: 12),

          ActiveExplorationTile(
            title: "Nature Lover",
            subtitle: "42 discovered",
            icon: Icons.park_rounded,
            color: Color(0xFF34D26A),
            progress: .54,
          ),

          SizedBox(height: 12),

          ActiveExplorationTile(
            title: "Road Walker",
            subtitle: "812 discovered",
            icon: Icons.alt_route_rounded,
            color: Color(0xFFFFA500),
            progress: .58,
          ),
        ],
      ),
    );
  }
}
