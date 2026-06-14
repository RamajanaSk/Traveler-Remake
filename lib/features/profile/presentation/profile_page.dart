import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBar.dart';
import 'package:travelerremake/core/widgets/panel/sidePanelWidget.dart';
import 'package:travelerremake/features/map/presentation/widgets/test_widget.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_achievments_section.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_cover_section.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_stats_section.dart';
import 'package:travelerremake/features/profile/presentation/sections/profile_progress_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: TravelerExplorerOverview(),
    );
  }
}
