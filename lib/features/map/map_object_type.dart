import 'dart:ui';

enum MapObjectType { building, road, tree, park }

class MapObject {
  final MapObjectType type;
  final List<GeoPoint> points;
  final double height;

  final Rect bounds;

  const MapObject({
    required this.type,
    required this.points,
    required this.height,
    required this.bounds,
  });
}

class GeoPoint {
  final double lat;
  final double lon;

  const GeoPoint({required this.lat, required this.lon});
}
