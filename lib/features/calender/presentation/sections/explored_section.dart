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
          backgroundColors: [Colors.grey, Colors.grey],
          progressColors: [Colors.green, Colors.green],
          cityDetails: const {},
        ),
      ],
    );
  }
}
