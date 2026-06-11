import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class BuildingRenderer {
  static void draw({
    required Canvas canvas,
    required MapObject object,
    required double zoom,
    required MapConverter converter,
  }) {
    if (zoom < 0.5) return;

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

    final color = Color.lerp(
      Colors.white.withValues(alpha: 0.5),
      Colors.green,
      object.discoveryProgress,
    )!;

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }
}
