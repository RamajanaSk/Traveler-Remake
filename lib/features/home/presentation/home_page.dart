import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_background_gradient.dart';
import 'package:travelerremake/core/theme/space_background.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBar.dart';
import 'package:travelerremake/core/widgets/panel/sidePanelWidget.dart';
import 'package:travelerremake/features/home/presentation/sections/home_cover_section.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/current_location_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/daily_streak_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/discovery_badge_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/live_explorer_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/map_progress_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/random_quest_card.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/todays_challenge_card.dart';

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

      appBar: TopNavBar(
        title: 'TRAVELER',

        trailingIcon1: Icons.notifications_outlined,
        trailingOnPressed1: () {
          print('Notifications');
        },

        trailingIcon2: Icons.share,
        trailingOnPressed2: () {
          print('Profile');
        },
      ),
      body: SpaceBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 7),

                Hero(
                  tag: "logo",
                  child: Center(
                    child: Image.asset("assets/logo.png", width: 170),
                  ),
                ),

                const Spacer(flex: 3),

                const Text(
                  "TRAVELER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    height: 0.95,
                  ),
                ),

                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xffFF2BD6),
                        Color(0xffA14DFF),
                        Color(0xff2EDBFF),
                      ],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "START",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.w900,
                      height: 0.95,
                    ),
                  ),
                ),

                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [Color(0xffA14DFF), Color(0xff2EDBFF)],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "DISCOVERING",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.w900,
                      height: 0.95,
                    ),
                  ),
                ),

                const SizedBox(height: 26),

                Container(
                  width: 60,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xffFF2BD6), Color(0xff2EDBFF)],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  "The best stories are never planned.\nThey begin the moment you step outside.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.72),
                    fontSize: 18,
                    height: 1.6,
                  ),
                ),

                const Spacer(),

                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Container(width: 1, height: 16, color: Colors.white24),
                    const SizedBox(width: 18),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Continue as Guest",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.55),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
