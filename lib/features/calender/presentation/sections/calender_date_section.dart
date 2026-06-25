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
    return CalendarDays(
      lastDay: DateTime.now(),
      selectedDate: selectedDate,
      onSelectDate: onSelectDate,
    );
  }
}
