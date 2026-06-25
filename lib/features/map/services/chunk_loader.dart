import 'dart:ui' show Offset;

class ChunkLoader {
  static Future<void> check({
    required Offset cameraPosition,
    required Future<void> Function(double lat, double lon) loadChunk,
    required double currentLat,
    required double currentLon,
  }) async {
    const step = 0.01;

    double? lat;
    double? lon;

    if (cameraPosition.dy < 500) {
      lat = currentLat + step;
      lon = currentLon;
    } else if (cameraPosition.dy > 2500) {
      lat = currentLat - step;
      lon = currentLon;
    } else if (cameraPosition.dx < 500) {
      lat = currentLat;
      lon = currentLon - step;
    } else if (cameraPosition.dx > 2500) {
      lat = currentLat;
      lon = currentLon + step;
    }

    if (lat != null && lon != null) {
      await loadChunk(lat, lon);
    }
  }
}
