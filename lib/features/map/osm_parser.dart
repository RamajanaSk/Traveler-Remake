import 'package:travelerremake/features/map/map_object_type.dart';

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
      if (element["type"] != "way") continue;

      final tags = element["tags"] ?? {};

      final nodeIds = List<int>.from(element["nodes"] ?? []);

      final points = nodeIds
          .where((id) => nodes.containsKey(id))
          .map((id) => nodes[id]!)
          .toList();

      if (points.isEmpty) continue;

      if (tags["building"] != null) {
        result.add(
          MapObject(
            type: MapObjectType.building,
            points: points,
            height: double.tryParse(tags["height"]?.toString() ?? "") ?? 20,
          ),
        );
      }

      if (tags["highway"] != null) {
        result.add(
          MapObject(type: MapObjectType.road, points: points, height: 0),
        );
      }

      if (tags["leisure"] == "park") {
        result.add(
          MapObject(type: MapObjectType.park, points: points, height: 0),
        );
      }
    }

    return result;
  }
}
