import 'package:flutter/material.dart';

class LiveTravelersCard extends StatelessWidget {
  const LiveTravelersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircleAvatar(radius: 28, child: Icon(Icons.people)),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "LIVE EXPLORERS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "324 travelers are currently moving.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
