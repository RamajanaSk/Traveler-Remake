import 'package:flutter/material.dart';
import 'package:travelerremake/features/calender/presentation/widgets/Calender/calenderDays.dart';

class CalendarDateSection extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onSelectDate;

  const CalendarDateSection({
    super.key,
    required this.selectedDate,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CalendarDays(
          lastDay: DateTime.now(),
          selectedDate: selectedDate,
          onSelectDate: onSelectDate,
        ),
      ),
    );
  }
}
