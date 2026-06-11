import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class TreeRenderer {
  static void draw({
    required Canvas canvas,
    required MapObject object,
    required double zoom,
    required MapConverter converter,
  }) {
    if (zoom < 2.0) return;

    final pos = converter.convert(object.points.first);

    final treeColor = Color.lerp(
      Colors.green.shade900,
      Colors.lime,
      object.discoveryProgress,
    )!;

    canvas.drawCircle(pos, 4 / zoom, Paint()..color = treeColor);
  }
}
