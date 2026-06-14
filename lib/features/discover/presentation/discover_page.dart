import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/presentation/sections/discover_cover_section.dart';
import 'package:travelerremake/features/discover/presentation/widgets/discover_search_bar.dart';
import 'package:travelerremake/features/discover/presentation/widgets/discover_user_list.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const DiscoverCoverSection(),

              const SizedBox(height: 20),

              DiscoverSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              Expanded(child: DiscoverUserList(searchQuery: searchQuery)),
            ],
          ),
        ),
      ),
    );
  }
}
