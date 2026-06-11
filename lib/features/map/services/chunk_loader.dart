import 'package:flutter/material.dart';

class ChunkLoader {
  static Future<void> check({
    required Offset cameraPosition,
    required Future<void> Function(double lat, double lon) loadChunk,
    required double currentLat,
    required double currentLon,
  }) async {
    const movementStep = 0.01;

    if (cameraPosition.dy < 500) {
      await loadChunk(currentLat + movementStep, currentLon);
    }

    if (cameraPosition.dy > 2500) {
      await loadChunk(currentLat - movementStep, currentLon);
    }

    if (cameraPosition.dx < 500) {
      await loadChunk(currentLat, currentLon - movementStep);
    }

    if (cameraPosition.dx > 2500) {
      await loadChunk(currentLat, currentLon + movementStep);
    }
  }
}
