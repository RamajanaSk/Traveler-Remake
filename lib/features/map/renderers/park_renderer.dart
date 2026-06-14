import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class ParkRenderer {
  static void draw({
    required Canvas canvas,
    required MapObject object,
    required double zoom,
    required MapConverter converter,
  }) {
    final path = Path();

    for (int i = 0; i < object.points.length; i++) {
      final pos = converter.convert(object.points[i]);

      if (i == 0) {
        path.moveTo(pos.dx, pos.dy);
      } else {
        path.lineTo(pos.dx, pos.dy);
      }
    }

    path.close();

    final parkColor = Color.lerp(
      Colors.white.withValues(alpha: 0.8),
      const Color.fromARGB(255, 93, 255, 98),
      object.discoveryProgress,
    )!;

    canvas.drawPath(
      path,
      Paint()
        ..color = parkColor
        ..style = PaintingStyle.fill,
    );
  }
}
