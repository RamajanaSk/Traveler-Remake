import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/traveler_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/live_indicator.dart';
import 'package:travelerremake/features/home/presentation/widgets/squareIconCard.dart';

class LiveExplorerCard extends StatelessWidget {
  const LiveExplorerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelerCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const LiveIndicator(),

              const SizedBox(width: 8),

              const Text(
                "LIVE ACTIVITY",
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SquareIconCard(
                icon: Icons.place_outlined,
                text: "24",
                backgroundColor: Color(0x2200D4FF),
                iconColor: Color(0xFF00D4FF),
              ),
              SquareIconCard(
                icon: Icons.people_outline,
                text: "12",
                backgroundColor: Color(0x228B5CF6),
                iconColor: Color(0xFF8B5CF6),
              ),
              SquareIconCard(
                icon: Icons.photo_camera_outlined,
                text: "5",
                backgroundColor: Color(0x22FFB800),
                iconColor: Color(0xFFFFB800),
              ),
              SquareIconCard(
                icon: Icons.shape_line,
                text: "12",
                backgroundColor: Color(0x22FFB800),
                iconColor: Color.fromARGB(255, 255, 10, 10),
              ),
              SquareIconCard(
                icon: Icons.route_outlined,
                text: "3",
                backgroundColor: Color(0x2200FF88),
                iconColor: Color(0xFF00FF88),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
