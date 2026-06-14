import 'package:flutter/material.dart';
import '../models/map_object_type.dart';

class MapConverter {
  const MapConverter();

  Offset convert(GeoPoint point) {
    return Offset(point.worldX, -point.worldY);
  }
}
