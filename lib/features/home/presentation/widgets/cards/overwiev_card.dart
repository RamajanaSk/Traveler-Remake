import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/overview_stat_tile.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF181C24),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              children: const [
                Expanded(
                  child: OverviewStatTile(
                    icon: Icons.local_fire_department_rounded,
                    iconColor: Color(0xFFFF6B35),
                    value: "12",
                    label: "Day Streak",
                  ),
                ),

                VerticalDivider(color: Colors.white10, thickness: 1),

                Expanded(
                  child: OverviewStatTile(
                    icon: Icons.location_on_rounded,
                    iconColor: Color(0xFF4DA3FF),
                    value: "34",
                    label: "Nearby",
                  ),
                ),

                VerticalDivider(color: Colors.white10, thickness: 1),

                Expanded(
                  child: OverviewStatTile(
                    icon: Icons.emoji_events_rounded,
                    iconColor: Color(0xFFFFC83D),
                    value: "#248",
                    label: "Global Rank",
                  ),
                ),

                VerticalDivider(color: Colors.white10, thickness: 1),

                Expanded(
                  child: OverviewStatTile(
                    icon: Icons.auto_awesome_rounded,
                    iconColor: Color(0xFF45D76A),
                    value: "4,582",
                    label: "Discoveries",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
