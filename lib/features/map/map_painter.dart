import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/map_object_type.dart';

class MapPainter extends CustomPainter {
  final List<MapObject> objects;

  MapPainter({required this.objects});

  @override
  void paint(Canvas canvas, Size size) {
    if (objects.isEmpty) return;

    double minLat = double.infinity;
    double maxLat = -double.infinity;

    double minLon = double.infinity;
    double maxLon = -double.infinity;

    for (final object in objects) {
      for (final point in object.points) {
        if (point.lat < minLat) minLat = point.lat;
        if (point.lat > maxLat) maxLat = point.lat;

        if (point.lon < minLon) minLon = point.lon;
        if (point.lon > maxLon) maxLon = point.lon;
      }
    }

    final latRange = maxLat - minLat;
    final lonRange = maxLon - minLon;

    Offset convert(GeoPoint point) {
      final x = ((point.lon - minLon) / lonRange) * size.width;

      final y = size.height - ((point.lat - minLat) / latRange) * size.height;

      return Offset(x, y);
    }

    final roadPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final buildingPaint = Paint()
      ..color = Colors.blue.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final treePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    for (final object in objects) {
      switch (object.type) {
        case MapObjectType.road:
          final path = Path();

          for (int i = 0; i < object.points.length; i++) {
            final pos = convert(object.points[i]);

            if (i == 0) {
              path.moveTo(pos.dx, pos.dy);
            } else {
              path.lineTo(pos.dx, pos.dy);
            }
          }

          canvas.drawPath(path, roadPaint);
          break;

        case MapObjectType.building:
          final path = Path();

          for (int i = 0; i < object.points.length; i++) {
            final pos = convert(object.points[i]);

            if (i == 0) {
              path.moveTo(pos.dx, pos.dy);
            } else {
              path.lineTo(pos.dx, pos.dy);
            }
          }

          path.close();

          canvas.drawPath(path, buildingPaint);
          break;

        case MapObjectType.tree:
          final pos = convert(object.points.first);

          canvas.drawCircle(pos, 4, treePaint);
          break;

        case MapObjectType.park:
          break;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
