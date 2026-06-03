import 'package:flutter/material.dart';

class RandomQuestCard extends StatelessWidget {
  const RandomQuestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🎲 RANDOM QUEST",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Text(
              "Visit a street you've never visited before.",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {},
              child: const Text("Generate New Quest"),
            ),
          ],
        ),
      ),
    );
  }
}
