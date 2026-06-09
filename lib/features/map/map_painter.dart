import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/map_object_type.dart';

class MapPainter extends CustomPainter {
  final List<MapObject> objects;
  final Offset cameraPosition;
  final double zoom;

  final double minLat;
  final double maxLat;
  final double minLon;
  final double maxLon;

  const MapPainter({
    required this.objects,
    required this.cameraPosition,
    required this.zoom,
    required this.minLat,
    required this.maxLat,
    required this.minLon,
    required this.maxLon,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (objects.isEmpty) return;

    final latRange = maxLat - minLat;
    final lonRange = maxLon - minLon;

    Offset convert(GeoPoint point) {
      final x = ((point.lon - minLon) / lonRange) * 3000;

      final y = 3000 - ((point.lat - minLat) / latRange) * 3000;

      return Offset(x, y);
    }

    canvas.save();

    canvas.translate(
      size.width / 2 - cameraPosition.dx,
      size.height / 2 - cameraPosition.dy,
    );

    canvas.scale(zoom);

    final roadPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2 / zoom
      ..style = PaintingStyle.stroke;

    final buildingPaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    final treePaint = Paint()..color = Colors.green;

    final parkPaint = Paint()
      ..color = Colors.green.withValues(alpha: 0.2)
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
          if (zoom < 1.3) break;

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
          if (zoom < 2.0) break;

          final pos = convert(object.points.first);

          canvas.drawCircle(pos, 4 / zoom, treePaint);
          break;

        case MapObjectType.park:
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

          canvas.drawPath(path, parkPaint);
          break;
      }
    }

    canvas.restore();

    final playerPaint = Paint()..color = Colors.orange;

    final center = Offset(size.width / 2, size.height / 2);

    final playerPath = Path();

    playerPath.moveTo(center.dx, center.dy - 20);
    playerPath.lineTo(center.dx - 14, center.dy + 14);
    playerPath.lineTo(center.dx, center.dy + 8);
    playerPath.lineTo(center.dx + 14, center.dy + 14);
    playerPath.close();

    canvas.drawShadow(playerPath, Colors.black, 4, true);

    canvas.drawPath(playerPath, playerPaint);
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.cameraPosition != cameraPosition ||
        oldDelegate.zoom != zoom ||
        oldDelegate.objects.length != objects.length;
  }
}
