import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBar.dart';
import 'package:travelerremake/core/widgets/panel/sidePanelWidget.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_achievments_section.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_cover_section.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_stats_section.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_progress_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidePanel(),
      appBar: TopNavBar(
        title: 'TRAVELER',
        trailingIcon1: Icons.notifications_outlined,
        trailingOnPressed1: () {
          debugPrint('Notifications');
        },
        trailingIcon2: Icons.person_outline,
        trailingOnPressed2: () {
          debugPrint('Profile');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: const [
            ProfileCoverSection(username: 'Ramajana'),

            SizedBox(height: 20),

            ProfileStatsSection(),

            SizedBox(height: 20),

            ProfileAchievementSection(),

            SizedBox(height: 20),

            ProfileProgressSection(),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
