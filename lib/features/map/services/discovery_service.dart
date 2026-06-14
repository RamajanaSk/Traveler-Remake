import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class DiscoveryService {
  static bool update({
    required List<MapObject> objects,
    required Offset playerPosition,
    required double discoverRadius,
    required MapConverter converter,
  }) {
    bool discoveredSomething = false;

    final discoverRadiusSquared = discoverRadius * discoverRadius;

    for (final object in objects) {
      if (object.discovered) continue;

      double closestDistanceSquared = double.infinity;

      for (final point in object.points) {
        final pos = converter.convert(point);

        final dx = pos.dx - playerPosition.dx;
        final dy = pos.dy - playerPosition.dy;

        final distanceSquared = dx * dx + dy * dy;

        if (distanceSquared < closestDistanceSquared) {
          closestDistanceSquared = distanceSquared;
        }
      }

      if (closestDistanceSquared < discoverRadiusSquared) {
        object.discoveryProgress = 1.0;
        object.discovered = true;
        discoveredSomething = true;
      }
    }

    return discoveredSomething;
  }
}
