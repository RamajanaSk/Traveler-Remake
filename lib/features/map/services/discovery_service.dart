import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class DiscoveryService {
  static bool update({
    required List<MapObject> objects,
    required Offset playerPosition,
    required MapConverter converter,
  }) {
    bool discoveredSomething = false;

    const previewRadius = 50.0;
    const discoverRadius = 20.0;

    const previewRadiusSquared = previewRadius * previewRadius;

    const discoverRadiusSquared = discoverRadius * discoverRadius;

    for (final object in objects) {
      if (object.discovered) continue;

      Offset objectPosition;

      if (object.type == MapObjectType.tree) {
        objectPosition = converter.convert(object.points.first);
      } else {
        final centerPoint = object.points[object.points.length ~/ 2];

        objectPosition = converter.convert(centerPoint);
      }

      final dx = objectPosition.dx - playerPosition.dx;

      final dy = objectPosition.dy - playerPosition.dy;

      // Grober Vorfilter
      if (dx.abs() > 200) continue;
      if (dy.abs() > 200) continue;

      final distanceSquared = dx * dx + dy * dy;

      // Spieler kommt in die Nähe
      if (distanceSquared < previewRadiusSquared) {
        object.discoveryProgress += 0.01;
      }

      // Spieler ist wirklich nah dran
      if (distanceSquared < discoverRadiusSquared) {
        object.discoveryProgress += 0.08;
      }

      if (object.discoveryProgress > 1.0) {
        object.discoveryProgress = 1.0;
      }

      if (!object.discovered && object.discoveryProgress >= 1.0) {
        object.discovered = true;
        discoveredSomething = true;
      }
    }

    return discoveredSomething;
  }
}
