import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/bigStatsCard.dart';
import 'package:travelerremake/features/home/presentation/widgets/smallStatsCard.dart';

class LocationSection extends StatelessWidget {
  final String cityName;
  final String latLong;
  final String totalSteps;
  final String totalDistance;
  final String unit;

  const LocationSection({
    super.key,
    required this.cityName,
    required this.latLong,
    required this.totalSteps,
    required this.totalDistance,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigStatsCard(
          icon: Icons.location_on,
          title: cityName,
          subtitle: latLong,
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: SmallStatsCard(
                value: "Berlin",
                title: "Current Location",
                icon: const Icon(Icons.directions_walk, size: 36),
              ),
            ),

            Expanded(
              child: SmallStatsCard(
                value: "12.543",
                title: "Total Steps",
                icon: const Icon(Icons.directions_walk, size: 36),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
