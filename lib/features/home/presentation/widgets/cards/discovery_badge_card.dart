import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/cards/traveler_card.dart';

class DiscoveryBadgeCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final int discovered;
  final int nextBadgeGoal;
  final String badgeName;

  const DiscoveryBadgeCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.discovered,
    required this.nextBadgeGoal,
    required this.badgeName,
  });

  @override
  Widget build(BuildContext context) {
    final progress = discovered / nextBadgeGoal;
    final remaining = (nextBadgeGoal - discovered).clamp(0, nextBadgeGoal);

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              //backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white.withValues(alpha: 0.04),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 56, color: iconColor),

                    const SizedBox(height: 20),

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "$discovered discovered",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "${(progress * 100).round()}%",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        color: iconColor,
                      ),
                    ),

                    const SizedBox(height: 12),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 5,
                        backgroundColor: Colors.white.withValues(alpha: 0.05),
                        valueColor: AlwaysStoppedAnimation(iconColor),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "$remaining remaining",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      badgeName,
                      style: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },

      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 28, color: iconColor),

                  const SizedBox(height: 12),

                  Text(
                    "$discovered",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    badgeName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress.clamp(0, 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
        ),
      ],
    );
  }
}
