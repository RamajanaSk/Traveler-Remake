import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/home_cover/home_cover_item.dart';

class HomeCoverCard extends StatelessWidget {
  final HomeCoverItem item;

  const HomeCoverCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.80)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          SizedBox(height: 10),
          Text(
            item.titleBelow,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            item.subtitle,
            style: const TextStyle(fontSize: 15, height: 1.5),
          ),

          const SizedBox(height: 24),

          InkWell(
            onTap: item.onTap,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(item.actionIcon, size: 18),
                  const SizedBox(width: 8),
                  Text(item.actionText, style: const TextStyle()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
