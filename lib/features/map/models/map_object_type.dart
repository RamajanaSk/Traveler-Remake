import 'dart:ui';

enum MapObjectType { building, road, tree, park }

class MapObject {
  final MapObjectType type;

  final List<GeoPoint> points;

  final double height;

  final Rect bounds;

  final Offset center;

  Offset? canvasCenter;

  bool isNearby;

  bool discovered;

  double discoveryProgress;

  final String id;

  final String? name;

  final Map<String, dynamic> tags;

  Path? cachedPath;

  MapObject({
    required this.type,
    required this.points,
    required this.bounds,
    required this.center,
    this.canvasCenter,
    this.height = 10,
    this.isNearby = false,
    this.discovered = false,
    this.discoveryProgress = 0.0,
    required this.id,
    this.name,
    required this.tags,
    this.cachedPath,
  });
}

class GeoPoint {
  final double lat;

  final double lon;

  const GeoPoint({required this.lat, required this.lon});
}
