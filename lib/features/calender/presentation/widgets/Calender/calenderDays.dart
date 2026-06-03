import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDays extends StatelessWidget {
  final DateTime lastDay;
  final DateTime selectedDate;
  final Function(DateTime) onSelectDate;

  const CalendarDays({
    super.key,
    required this.lastDay,
    required this.selectedDate,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: List.generate(7, (index) {
        final date = lastDay.subtract(Duration(days: 6 - index));

        final isSelected =
            date.day == selectedDate.day &&
            date.month == selectedDate.month &&
            date.year == selectedDate.year;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => onSelectDate(date),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                curve: Curves.easeOut,
                height: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                  gradient: isSelected
                      ? const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF6A11CB),
                            Color(0xFF2575FC),
                            Color(0xFF00D4FF),
                          ],
                        )
                      : null,

                  color: isSelected
                      ? null
                      : theme.colorScheme.surfaceContainerHighest,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('E').format(date),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      DateFormat('d').format(date),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? Colors.white
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
