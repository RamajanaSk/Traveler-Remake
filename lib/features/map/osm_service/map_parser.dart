import 'package:travelerremake/features/map/building_cache/building_model.dart';
import 'package:travelerremake/features/map/osm_service/map_data.dart';

class MapParser {
  static MapData parse(Map<String, dynamic> json) {
    final List<BuildingModel> buildings = [];

    // TODO:
    // OSM JSON → BuildingModel

    return MapData(buildings: buildings);
  }
}
