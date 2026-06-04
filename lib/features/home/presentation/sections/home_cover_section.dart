import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/presentation/discover_page.dart';
import 'package:travelerremake/features/home/presentation/widgets/home_cover/home_cover_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/home_cover/home_cover_item.dart';

class HomeCoverSection extends StatelessWidget {
  const HomeCoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(32)),
      child: Stack(
        children: [
          HomeCoverCard(
            item: HomeCoverItem(
              badge: "TODAY'S REMINDER",
              title: "Adventure",
              titleBelow: "starts outside",
              subtitle: "The best stories rarely happen on the couch.",
              actionText: "Go somewhere you haven't been before.",
              actionIcon: Icons.explore_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DiscoverPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
