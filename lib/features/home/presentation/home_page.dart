import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_background_gradient.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBar.dart';
import 'package:travelerremake/core/widgets/panel/sidePanelWidget.dart';
import 'package:travelerremake/features/home/presentation/sections/home_cover_section.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/active_exploration_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/current_location_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/daily_streak_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/discovery_badge_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/explorer_level_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/live_explorer_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/map_progress_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/next_title_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/overwiev_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/random_quest_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/todays_challenge_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/hero_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, dynamic>> cardData = [
    {
      'text': '400m',
      'iconColor': Colors.blue,
      'backgroundColor': Colors.blue.withOpacity(0.1),
    },
    {
      'text': '3km',
      'iconColor': Colors.purple,
      'backgroundColor': Colors.purple.withOpacity(0.1),
    },
    {
      'text': '21km',
      'iconColor': Colors.green,
      'backgroundColor': Colors.green.withOpacity(0.1),
    },
    {
      'text': '42km',
      'iconColor': Colors.red,
      'backgroundColor': Colors.red.withOpacity(0.1),
    },
  ];

  static final List<Map<String, dynamic>> places = [
    {
      'name': 'Eiffel Tower',
      'city': 'Paris',
      'longitude': '2.2945',
      'latitude': '48.8584',
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'Landmark',
    },
    {
      'name': 'Brandenburg Gate',
      'city': 'Berlin',
      'longitude': '13.3777',
      'latitude': '52.5163',
      'timestamp': DateTime.now()
          .subtract(const Duration(hours: 5))
          .toIso8601String(),
      'type': 'Historical',
    },
    {
      'name': 'Colosseum',
      'city': 'Rome',
      'longitude': '12.4922',
      'latitude': '41.8902',
      'timestamp': DateTime.now()
          .subtract(const Duration(days: 1))
          .toIso8601String(),
      'type': 'Historical',
    },
  ];

  static const Map<String, IconData> typeIcons = {
    'Landmark': Icons.location_city,
    'Historical': Icons.account_balance,
    'Nature': Icons.park,
  };

  static const Map<String, Color> typeColors = {
    'Landmark': Colors.blue,
    'Historical': Colors.orange,
    'Nature': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidePanel(),
      backgroundColor: Colors.black,
      /*appBar: TopNavBar(
        title: "",

        leadingWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),

            const SizedBox(width: 12),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Good Evening",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),

                Text(
                  "Ramajana ✨",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          ],
        ),

        trailingIcon1: Icons.notifications_none,
        trailingOnPressed1: () {},
      ),
*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeroHeader(),
            //const HomeCoverSection(), Adnevture starts outside
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ExplorerLevelCard(
                    level: 12,
                    currentXp: 1660,
                    nextLevelXp: 2000,
                    rank: "Explorer",
                  ),

                  const SizedBox(height: 16),

                  const OverviewCard(),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF181C24),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(.05)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "ACTIVE EXPLORATION",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                  color: Colors.white54,
                                ),
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                // TODO
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                "View All",
                                style: TextStyle(
                                  color: Color(0xFF4E7CFF),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Column(
                          children: const [
                            ActiveExplorationTile(
                              title: "City Explorer",
                              subtitle: "127 discovered",
                              icon: Icons.apartment_rounded,
                              color: Color(0xFF58B5F6),
                              progress: .51,
                            ),

                            SizedBox(height: 12),

                            ActiveExplorationTile(
                              title: "Nature Lover",
                              subtitle: "42 discovered",
                              icon: Icons.park_rounded,
                              color: Color(0xFF22C55E),
                              progress: .42,
                            ),

                            SizedBox(height: 12),

                            ActiveExplorationTile(
                              title: "Road Walker",
                              subtitle: "812 discovered",
                              icon: Icons.alt_route_rounded,
                              color: Color(0xFFF59E0B),
                              progress: .81,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // <-- Keep ALL your remaining widgets here
                  const LiveExplorerCard(),

                  const SizedBox(height: 20),

                  const SizedBox(height: 16),

                  MapProgressCard(),

                  const RandomQuestCard(),

                  // ...everything else...
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
