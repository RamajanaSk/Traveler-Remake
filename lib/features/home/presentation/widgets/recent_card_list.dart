import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentPlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;
  final Map<String, IconData> typeIcons;
  final Map<String, Color> typeColors;

  const RecentPlaceCard({
    super.key,
    required this.place,
    required this.typeIcons,
    required this.typeColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      typeIcons[place['type']] ?? Icons.location_on,
                      color: typeColors[place['type']] ?? Colors.blue,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      place['name'] ?? 'Unknown',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                Text(
                  _formatTimestamp(place['timestamp'] ?? ''),
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 4,
                    children: [
                      Text(
                        place['city'] ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),

                      Text(
                        place['longitude'] ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),

                      Text(
                        place['latitude'] ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),

                Text(
                  _formatTime(place['timestamp'] ?? ''),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    final dateTime = DateTime.parse(timestamp);

    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);

    final yesterday = today.subtract(const Duration(days: 1));

    if (dateTime.isAfter(today)) {
      return "Today";
    }

    if (dateTime.isAfter(yesterday)) {
      return "Yesterday";
    }

    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String _formatTime(String timestamp) {
    final dateTime = DateTime.parse(timestamp);

    return DateFormat('HH:mm').format(dateTime);
  }
}
