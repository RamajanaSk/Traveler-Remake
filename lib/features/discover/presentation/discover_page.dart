import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/presentation/sections/discover_cover_section.dart';
import 'package:travelerremake/features/discover/presentation/widgets/discover_search_bar.dart';
import 'package:travelerremake/features/discover/presentation/widgets/discover_user_list.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              DiscoverCoverSection(),

              SizedBox(height: 20),

              DiscoverSearchBar(),

              SizedBox(height: 20),

              Expanded(child: DiscoverUserList()),
            ],
          ),
        ),
      ),
    );
  }
}
