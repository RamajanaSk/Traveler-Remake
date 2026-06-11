import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/models/player.dart';

class MapPainter extends CustomPainter {
  final List<MapObject> objects;
  final Offset cameraPosition;
  final double zoom;

  final double minLat;
  final double maxLat;
  final double minLon;
  final double maxLon;

  final Player player;

  const MapPainter({
    required this.objects,
    required this.cameraPosition,
    required this.zoom,
    required this.minLat,
    required this.maxLat,
    required this.minLon,
    required this.maxLon,
    required this.player,
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

    final playerPosition = player.position;
    canvas.save();

    canvas.translate(size.width / 2, size.height / 2);
    canvas.scale(zoom);
    canvas.translate(-cameraPosition.dx, -cameraPosition.dy);

    final roadPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..strokeWidth = 2 / zoom
      ..style = PaintingStyle.stroke;

    final buildingPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    final treePaint = Paint()..color = Colors.green;

    final parkPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    for (final object in objects) {
      switch (object.type) {
        case MapObjectType.road:
          final path = Path();

          double centerX = 0;
          double centerY = 0;

          for (int i = 0; i < object.points.length; i++) {
            final pos = convert(object.points[i]);

            centerX += pos.dx;
            centerY += pos.dy;

            if (i == 0) {
              path.moveTo(pos.dx, pos.dy);
            } else {
              path.lineTo(pos.dx, pos.dy);
            }
          }

          final roadCenter = Offset(
            centerX / object.points.length,
            centerY / object.points.length,
          );

          final distance = (roadCenter - playerPosition).distance;

          if (!object.discovered && distance < 150) {
            object.discoveryProgress += 0.2;

            if (object.discoveryProgress >= 1.0) {
              object.discoveryProgress = 1.0;
              object.discovered = true;
            }
          }

          final roadColor = Color.lerp(
            Colors.grey,
            Colors.green,
            object.discoveryProgress,
          )!;

          canvas.drawPath(
            path,
            Paint()
              ..color = roadColor
              ..strokeWidth = 2 / zoom
              ..style = PaintingStyle.stroke,
          );

          break;

        case MapObjectType.building:
          if (zoom < 0.5) break;

          final path = Path();

          double centerX = 0;
          double centerY = 0;

          for (int i = 0; i < object.points.length; i++) {
            final pos = convert(object.points[i]);

            centerX += pos.dx;
            centerY += pos.dy;

            if (i == 0) {
              path.moveTo(pos.dx, pos.dy);
            } else {
              path.lineTo(pos.dx, pos.dy);
            }
          }

          path.close();

          final buildingCenter = Offset(
            centerX / object.points.length,
            centerY / object.points.length,
          );

          final distance = (buildingCenter - playerPosition).distance;

          if (!object.discovered && distance < 150) {
            object.discoveryProgress += 0.2;

            if (object.discoveryProgress >= 1.0) {
              object.discoveryProgress = 1.0;
              object.discovered = true;
            }
          }

          final buildingColor = Color.lerp(
            const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.5),
            Colors.green,
            object.discoveryProgress,
          )!;

          canvas.drawPath(
            path,
            Paint()
              ..color = buildingColor
              ..style = PaintingStyle.fill,
          );

          break;

        case MapObjectType.tree:
          if (zoom < 2.0) break;

          final pos = convert(object.points.first);

          final distance = (pos - playerPosition).distance;

          if (!object.discovered && distance < 150) {
            object.discoveryProgress += 0.2;

            if (object.discoveryProgress >= 1.0) {
              object.discoveryProgress = 1.0;
              object.discovered = true;
            }
          }

          final treeColor = Color.lerp(
            Colors.green.shade900,
            Colors.lime,
            object.discoveryProgress,
          )!;

          canvas.drawCircle(pos, 4 / zoom, Paint()..color = treeColor);

          break;

        case MapObjectType.park:
          final path = Path();

          double centerX = 0;
          double centerY = 0;

          for (int i = 0; i < object.points.length; i++) {
            final pos = convert(object.points[i]);

            centerX += pos.dx;
            centerY += pos.dy;

            if (i == 0) {
              path.moveTo(pos.dx, pos.dy);
            } else {
              path.lineTo(pos.dx, pos.dy);
            }
          }

          path.close();

          final parkCenter = Offset(
            centerX / object.points.length,
            centerY / object.points.length,
          );

          final distance = (parkCenter - playerPosition).distance;

          if (!object.discovered && distance < 150) {
            object.discoveryProgress += 0.2;

            if (object.discoveryProgress >= 1.0) {
              object.discoveryProgress = 1.0;
              object.discovered = true;
            }
          }

          final parkColor = Color.lerp(
            Colors.green.withValues(alpha: 0.2),
            Colors.greenAccent.withValues(alpha: 0.6),
            object.discoveryProgress,
          )!;

          canvas.drawPath(
            path,
            Paint()
              ..color = parkColor
              ..style = PaintingStyle.fill,
          );

          break;
      }
    }

    canvas.restore();

    final center = Offset(size.width / 2, size.height / 2);

    final hitboxPaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, player.radius * 5, hitboxPaint);

    final glowPaint = Paint()..color = Colors.blue.withValues(alpha: 0.25);

    canvas.drawCircle(center, 30, glowPaint);

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

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.cameraPosition != cameraPosition ||
        oldDelegate.zoom != zoom ||
        oldDelegate.objects.length != objects.length;
  }
}
