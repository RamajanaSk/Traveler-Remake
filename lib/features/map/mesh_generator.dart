import 'package:travelerremake/features/map/building_mesh.dart';
import 'package:travelerremake/features/map/coordinate_converter.dart';
import 'package:travelerremake/features/map/map_object_type.dart';

class MeshGenerator {
  static BuildingMesh generateBuilding(
    MapObject object,
    double originLat,
    double originLon,
  ) {
    final vertices = object.points.map((point) {
      return CoordinateConverter.toWorld(
        point.lat,
        point.lon,
        originLat,
        originLon,
      );
    }).toList();

    return BuildingMesh(vertices: vertices, height: object.height);
  }
}
