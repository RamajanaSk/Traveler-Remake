import 'dart:ui';

import 'package:travelerremake/features/map/models/map_object_type.dart';

class OSMParser {
  List<MapObject> parse(Map<String, dynamic> json) {
    final elements = json["elements"] as List<dynamic>;

    final nodes = <int, GeoPoint>{};

    for (final element in elements) {
      if (element["type"] == "node") {
        nodes[element["id"]] = GeoPoint(
          lat: element["lat"],
          lon: element["lon"],
        );
      }
    }

    final result = <MapObject>[];

    for (final element in elements) {
      final tags = element["tags"] ?? {};

      // TREES
      if (element["type"] == "node") {
        if (tags["natural"] == "tree") {
          final point = nodes[element["id"]];

          if (point != null) {
            result.add(
              MapObject(
                type: MapObjectType.tree,
                points: [point],
                height: 0,
                bounds: Rect.fromLTWH(point.lon, point.lat, 0, 0),
                center: Offset(point.lon, point.lat),
              ),
            );
          }
        }

        continue;
      }

      if (element["type"] != "way") continue;

      final nodeIds = List<int>.from(element["nodes"] ?? []);

      final points = nodeIds
          .where((id) => nodes.containsKey(id))
          .map((id) => nodes[id]!)
          .toList();

      if (points.isEmpty) continue;

      double minLat = double.infinity;
      double maxLat = -double.infinity;

      double minLon = double.infinity;
      double maxLon = -double.infinity;

      double centerLat = 0;
      double centerLon = 0;

      for (final point in points) {
        minLat = point.lat < minLat ? point.lat : minLat;
        maxLat = point.lat > maxLat ? point.lat : maxLat;

        minLon = point.lon < minLon ? point.lon : minLon;
        maxLon = point.lon > maxLon ? point.lon : maxLon;

        centerLat += point.lat;
        centerLon += point.lon;
      }

      centerLat /= points.length;
      centerLon /= points.length;

      final bounds = Rect.fromLTRB(minLon, minLat, maxLon, maxLat);

      if (tags["building"] != null) {
        result.add(
          MapObject(
            type: MapObjectType.building,
            points: points,
            height: double.tryParse(tags["height"]?.toString() ?? "") ?? 20,
            bounds: bounds,
            center: Offset(centerLon, centerLat),
          ),
        );
      }

      if (tags["highway"] != null) {
        result.add(
          MapObject(
            type: MapObjectType.road,
            points: points,
            height: 0,
            bounds: bounds,
            center: Offset(centerLon, centerLat),
          ),
        );
      }

      if (tags["leisure"] == "park") {
        result.add(
          MapObject(
            type: MapObjectType.park,
            points: points,
            height: 0,
            bounds: bounds,
            center: Offset(centerLon, centerLat),
          ),
        );
      }
    }

    return result;
  }
}
