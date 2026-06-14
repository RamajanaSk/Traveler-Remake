import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_colors.dart';
import 'package:travelerremake/features/discover/presentation/discover_page.dart';
import 'package:travelerremake/features/home/presentation/home_page.dart';
import 'package:travelerremake/features/calender/presentation/calender_page.dart';
import 'package:travelerremake/features/map/presentation/map_page.dart';

import 'package:travelerremake/features/profile/presentation/profile_page.dart';

// ignore: must_be_immutable
class TravelerBottomBar extends StatefulWidget {
  int index = 0;
  final String username;
  final String userId;

  TravelerBottomBar({
    super.key,
    int transIndex = 0,
    required this.username,
    required this.userId,
  }) {
    index = transIndex;
  }

  @override
  State<TravelerBottomBar> createState() => _TravelerBottomBarState();
}

class _TravelerBottomBarState extends State<TravelerBottomBar> {
  late List<Widget> screens;

  final List<dynamic> navIcons = [
    Icons.home_outlined,
    Icons.search,
    'assets/icons/pin2.png',
    Icons.bar_chart,
    Icons.person_outlined,
  ];

  @override
  void initState() {
    super.initState();

    screens = const [
      HomePage(),
      DiscoverPage(),
      MapPage(),
      CalendarPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Widget selectedScreen = screens[widget.index];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: widget.index, children: screens),
      bottomNavigationBar: Container(
        height: 72,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navIcons.asMap().entries.map((entry) {
            final index = entry.key;
            final icon = entry.value;

            final isSelected = widget.index == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.index = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 18 : 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.middleGradientColor.withOpacity(0.05)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: icon is IconData
                    ? Icon(
                        icon,
                        size: 24,
                        color: isSelected
                            ? AppColors.middleGradientColor
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      )
                    : Image.asset(
                        icon,
                        width: 24,
                        height: 24,
                        color: isSelected
                            ? AppColors.middleGradientColor
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
