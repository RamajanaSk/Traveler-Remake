import 'package:flutter/material.dart';
import 'package:travelerremake/features/calender/presentation/widgets/ProgressBar/segmentedProgressBar.dart';

class TravelTypeSection extends StatelessWidget {
  const TravelTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SegmentedProgressBar(
      progressList: const [0.4, 0.3, 0.2],
      segmentColors: const [Colors.lightBlue, Colors.blue, Colors.purple],
      title: 'Travelled by',
      labels: const ['Train', 'Bike', 'Car'],
      icons: const [Icons.train, Icons.pedal_bike, Icons.car_rental],
    );
  }
}
