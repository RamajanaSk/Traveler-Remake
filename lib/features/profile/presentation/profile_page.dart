import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBar.dart';
import 'package:travelerremake/core/widgets/panel/sidePanelWidget.dart';
import 'package:travelerremake/features/auth/presentation/pages/start_page.dart';
import 'package:travelerremake/features/profile/presentation/widgets/explorer_level_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidePanel(),

      appBar: TopNavBar(
        title: "PROFILE",
        trailingIcon1: Icons.logout,
        trailingOnPressed1: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const StartPage()),
          );
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: const [
            ExplorerLevelCard(),

            SizedBox(height: 20),

            // ProfileProgressSection(),

            // SizedBox(height: 20),

            // ProfileAchievementsSection(),

            // SizedBox(height: 20),

            // ProfileStatsSection(),
          ],
        ),
      ),
    );
  }
}
