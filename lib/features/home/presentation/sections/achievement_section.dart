import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/squareIconCard.dart';

class AchievementSection extends StatelessWidget {
  final List<Map<String, dynamic>> cardData;

  const AchievementSection({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final data = cardData[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SquareIconCard(
              icon: Icons.person,
              text: data['text'],
              iconColor: data['iconColor'],
              backgroundColor: data['backgroundColor'],
            ),
          );
        },
      ),
    );
  }
}
