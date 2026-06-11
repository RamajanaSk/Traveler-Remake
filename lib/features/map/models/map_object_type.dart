import 'dart:ui';

enum MapObjectType { building, road, tree, park }

class MapObject {
  final MapObjectType type;
  final List<GeoPoint> points;

  /// Gebäudehöhe in Metern
  final double height;

  /// Bounding Box für schnelle Kollisionen
  final Rect bounds;

  /// Mittelpunkt des Objekts
  final Offset center;

  bool isNearby;
  bool discovered;
  double discoveryProgress;

  MapObject({
    required this.type,
    required this.points,
    required this.bounds,
    required this.center,
    this.height = 10,
    this.isNearby = false,
    this.discovered = false,
    this.discoveryProgress = 0.0,
  });
}

class GeoPoint {
  final double lat;
  final double lon;

  const GeoPoint({required this.lat, required this.lon});
}
