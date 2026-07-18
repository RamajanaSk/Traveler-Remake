import 'dart:math';

import 'package:flutter/material.dart';

class ExplorerLevelCard extends StatelessWidget {
  final int level;
  final int currentXp;
  final int nextLevelXp;
  final String rank;

  const ExplorerLevelCard({
    super.key,
    required this.level,
    required this.currentXp,
    required this.nextLevelXp,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentXp / nextLevelXp).clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181C24),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// LEFT
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LevelBadge(level: level, size: 52),

                      const SizedBox(width: 14),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Level $level",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            rank,
                            style: const TextStyle(
                              color: Color(0xFF6A6DFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// RIGHT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${(progress * 100).round()}%",
                      style: const TextStyle(
                        color: Color(0xFF3F3FFF),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$currentXp / $nextLevelXp XP",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.65),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// XP BAR
          SizedBox(
            height: 5,
            width: double.infinity,
            child: Stack(
              children: [
                Container(color: Colors.white.withOpacity(.05)),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(color: const Color(0xFF56A8FF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LevelBadge extends StatelessWidget {
  final int level;
  final double size;

  const LevelBadge({super.key, required this.level, this.size = 52});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _HexagonPainter(),
        child: Center(
          child: Text(
            "$level",
            style: TextStyle(
              color: Colors.white,
              fontSize: size * .38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * .44;

    final path = Path();

    for (int i = 0; i < 6; i++) {
      final angle = (pi / 3 * i) - pi / 2;
      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();

    final glow = Paint()
      ..color = const Color(0xFFB55DFF).withOpacity(.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawPath(path, glow);

    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.3
      ..shader = const LinearGradient(
        colors: [Color(0xFFFF73F7), Color(0xFF7A5CFF)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
