import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/player.dart';

class PlayerRenderer {
  static void draw({
    required Canvas canvas,
    required Size size,
    required Player player,
  }) {
    final screenCenter = Offset(size.width / 2, size.height / 2);

    final outerRadius = player.radius * 5;

    final outerPaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    final pulsePaint = Paint()..color = Colors.blue.withValues(alpha: 0.25);

    final playerPaint = Paint()..color = Colors.blue;

    final innerPaint = Paint()..color = Colors.white;

    final borderPaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(screenCenter, outerRadius, outerPaint);

    canvas.drawCircle(screenCenter, 30, pulsePaint);

    canvas.drawCircle(screenCenter, player.radius, playerPaint);

    canvas.drawCircle(screenCenter, player.radius / 2, innerPaint);

    canvas.drawCircle(screenCenter, outerRadius, borderPaint);
  }
}
