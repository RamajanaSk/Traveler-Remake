import 'package:flutter/material.dart';
import '../models/map_object_type.dart';

class MapConverter {
  final double minLat;
  final double maxLat;
  final double minLon;
  final double maxLon;

  const MapConverter({
    required this.minLat,
    required this.maxLat,
    required this.minLon,
    required this.maxLon,
  });

  Offset convert(GeoPoint point) {
    final latRange = maxLat - minLat;
    final lonRange = maxLon - minLon;

    final x = ((point.lon - minLon) / lonRange) * 3000;
    final y = 3000 - ((point.lat - minLat) / latRange) * 3000;

    return Offset(x, y);
  }
}
