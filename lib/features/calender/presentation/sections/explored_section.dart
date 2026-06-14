import 'package:flutter/material.dart';
import 'package:travelerremake/features/calender/presentation/widgets/ProgressBar/multipleProgressBar.dart';

class ExploredSection extends StatelessWidget {
  const ExploredSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Explored", style: Theme.of(context).textTheme.titleLarge),

        const SizedBox(height: 12),

        MultipleProgressBar(
          cityName: ['Stuttgart', 'Heilbronn'],
          cityProgress: [1.2, 1.0],
          progressList: [0.2, 0.1],
          backgroundColors: [const Color(0xFF1E293B), const Color(0xFF334155)],
          progressColors: [const Color(0xFF00D4FF), const Color(0xFF3B82F6)],
          cityDetails: {
            "Stuttgart": {
              "Buildings": 523,
              "Roads": 182,
              "Trees": 941,
              "Parks": 31,
              "Forests": 14,
              "Water": 6,
              "Railways": 12,
              "POI": 44,
            },
            "Heilbronn": {
              "Buildings": 523,
              "Roads": 182,
              "Trees": 941,
              "Parks": 31,
              "Forests": 14,
              "Water": 6,
              "Railways": 12,
              "POI": 44,
            },
          },
        ),
      ],
    );
  }
}
