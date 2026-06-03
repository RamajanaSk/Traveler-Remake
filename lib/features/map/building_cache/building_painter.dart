import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/building_cache/building_model.dart';

class BuildingPainter extends CustomPainter {
  final List<BuildingModel> buildings;

  BuildingPainter({required this.buildings});

  @override
  void paint(Canvas canvas, Size size) {
    if (buildings.isEmpty) return;

    final paint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    double minLat = double.infinity;
    double maxLat = -double.infinity;

    double minLon = double.infinity;
    double maxLon = -double.infinity;

    for (final building in buildings) {
      for (final point in building.points) {
        minLat = point.lat < minLat ? point.lat : minLat;
        maxLat = point.lat > maxLat ? point.lat : maxLat;

        minLon = point.lon < minLon ? point.lon : minLon;
        maxLon = point.lon > maxLon ? point.lon : maxLon;
      }
    }

    final latRange = maxLat - minLat;
    final lonRange = maxLon - minLon;

    for (final building in buildings) {
      final path = Path();

      for (int i = 0; i < building.points.length; i++) {
        final point = building.points[i];

        final x = ((point.lon - minLon) / lonRange) * size.width;

        final y = size.height - ((point.lat - minLat) / latRange) * size.height;

        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }

      path.close();

      canvas.drawPath(path, paint);

      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
