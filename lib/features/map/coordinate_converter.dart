import 'dart:math';

class CoordinateConverter {
  static const double earthRadius = 6378137;

  static Point<double> toWorld(
    double lat,
    double lon,
    double originLat,
    double originLon,
  ) {
    final x = (lon - originLon) * earthRadius * cos(originLat * pi / 180);

    final z = (lat - originLat) * earthRadius;

    return Point(x, z);
  }
}
