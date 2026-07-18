import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBar.dart';
import 'package:travelerremake/core/widgets/panel/sidePanelWidget.dart';
import 'package:travelerremake/features/calender/presentation/sections/calender_date_section.dart';
import 'package:travelerremake/features/calender/presentation/sections/explored_section.dart';
import 'package:travelerremake/features/calender/presentation/sections/statistics_section.dart';
import 'package:travelerremake/features/calender/presentation/sections/travel_type_section.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDate = DateTime.now();

  Map<String, dynamic> selectedStatistics = {};

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidePanel(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CalendarDateSection(
              selectedDate: selectedDate,
              onSelectDate: _onDateSelected,
            ),

            const SizedBox(height: 20),

            const ExploredSection(),

            const SizedBox(height: 20),

            TravelTypeSection(),

            const SizedBox(height: 20),

            StatisticsSection(
              selectedDate: selectedDate,
              statistics: selectedStatistics,
            ),
          ],
        ),
      ),
    );
  }
}
