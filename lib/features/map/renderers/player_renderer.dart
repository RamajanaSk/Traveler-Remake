import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/player.dart';

class PlayerRenderer {
  static void draw({
    required Canvas canvas,
    required Size size,
    required Player player,
  }) {
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(
      center,
      player.radius * 5,
      Paint()
        ..color = Colors.blue.withValues(alpha: 0.12)
        ..style = PaintingStyle.fill,
    );

    canvas.drawCircle(
      center,
      30,
      Paint()..color = Colors.blue.withValues(alpha: 0.25),
    );

    canvas.drawCircle(center, player.radius, Paint()..color = Colors.blue);

    canvas.drawCircle(center, player.radius / 2, Paint()..color = Colors.white);

    canvas.drawCircle(
      center,
      player.radius * 5,
      Paint()
        ..color = Colors.blue.withValues(alpha: 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }
}
