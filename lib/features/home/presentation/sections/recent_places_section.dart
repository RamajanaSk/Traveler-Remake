import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/recent_card_list.dart';

class RecentPlacesSection extends StatelessWidget {
  final List<Map<String, dynamic>> places;
  final Map<String, IconData> typeIcons;
  final Map<String, Color> typeColors;

  const RecentPlacesSection({
    super.key,
    required this.places,
    required this.typeIcons,
    required this.typeColors,
  });

  @override
  Widget build(BuildContext context) {
    final sortedPlaces = List<Map<String, dynamic>>.from(places);

    sortedPlaces.sort(
      (a, b) => DateTime.parse(
        b['timestamp'],
      ).compareTo(DateTime.parse(a['timestamp'])),
    );

    final latestPlaces = sortedPlaces.take(3).toList();

    return Column(
      children: latestPlaces
          .map(
            (place) => RecentPlaceCard(
              place: place,
              typeIcons: typeIcons,
              typeColors: typeColors,
            ),
          )
          .toList(),
    );
  }
}
