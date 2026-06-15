import 'package:flutter/material.dart';

class AreaProgressCard extends StatelessWidget {
  final String areaName;
  final int discovered;
  final int total;

  const AreaProgressCard({
    super.key,
    required this.areaName,
    required this.discovered,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final progress = discovered / total;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "AREA COMPLETION",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 8),

          Text(
            areaName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),

          const SizedBox(height: 12),

          LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            borderRadius: BorderRadius.circular(999),
          ),

          const SizedBox(height: 8),

          Text(
            "$discovered / $total discovered",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
