import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/models/player.dart';
import 'package:travelerremake/features/map/renderers/building_renderer.dart';
import 'package:travelerremake/features/map/renderers/park_renderer.dart';
import 'package:travelerremake/features/map/renderers/player_renderer.dart';
import 'package:travelerremake/features/map/renderers/road_renderer.dart';
import 'package:travelerremake/features/map/renderers/tree_renderer.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class MapPainter extends CustomPainter {
  final List<MapObject> objects;
  final Offset cameraPosition;
  final double zoom;
  final Player player;
  final MapConverter converter;

  const MapPainter({
    required this.objects,
    required this.cameraPosition,
    required this.zoom,
    required this.player,
    required this.converter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (objects.isEmpty) return;

    canvas.save();

    canvas.translate(size.width / 2, size.height / 2);
    canvas.scale(zoom);
    canvas.translate(-cameraPosition.dx, -cameraPosition.dy);

    for (final object in objects) {
      switch (object.type) {
        case MapObjectType.road:
          RoadRenderer.draw(
            canvas: canvas,
            object: object,
            zoom: zoom,
            converter: converter,
          );
          break;

        case MapObjectType.building:
          BuildingRenderer.draw(
            canvas: canvas,
            object: object,
            zoom: zoom,
            converter: converter,
          );
          break;

        case MapObjectType.tree:
          TreeRenderer.draw(
            canvas: canvas,
            object: object,
            zoom: zoom,
            converter: converter,
          );
          break;

        case MapObjectType.park:
          ParkRenderer.draw(
            canvas: canvas,
            object: object,
            zoom: zoom,
            converter: converter,
          );
          break;
      }
    }

    canvas.restore();

    PlayerRenderer.draw(canvas: canvas, size: size, player: player);
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.cameraPosition != cameraPosition ||
        oldDelegate.zoom != zoom ||
        oldDelegate.objects.length != objects.length;
  }
}
