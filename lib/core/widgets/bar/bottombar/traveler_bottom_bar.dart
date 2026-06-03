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
    Widget selectedScreen = screens[widget.index];

    return Scaffold(
      extendBody: true,
      body: selectedScreen,
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.only(right: 15, left: 15, bottom: 17),
        decoration: BoxDecoration(
          color: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? const Color.fromARGB(44, 255, 254, 254)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 1, 1, 1),
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navIcons.asMap().entries.map((entry) {
            final index = entry.key;
            final icon = entry.value;

            final isSelected = widget.index == index;

            return Material(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.transparent
                  : Colors.white,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.index = index;
                  });
                },
                child: Card(
                  elevation: isSelected ? 3 : 0,
                  color: isSelected
                      ? MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? const Color.fromRGBO(255, 255, 255, 0.064)
                            : Colors.white
                      : MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                      ? Colors.transparent
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: icon is IconData
                        ? Icon(
                            icon,
                            color: isSelected
                                ? AppColors.middleGradientColor
                                : MediaQuery.of(context).platformBrightness ==
                                      Brightness.dark
                                ? Colors.white
                                : null,
                          )
                        : Image.asset(
                            icon,
                            width: 25,
                            height: 25,
                            color: isSelected
                                ? AppColors.middleGradientColor
                                : MediaQuery.of(context).platformBrightness ==
                                      Brightness.dark
                                ? Colors.white
                                : null,
                          ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
