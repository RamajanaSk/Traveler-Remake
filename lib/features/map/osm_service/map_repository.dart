import 'package:travelerremake/features/map/osm_service/map_data.dart';
import 'package:travelerremake/features/map/osm_service/map_parser.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';

class MapRepository {
  final OSMService service;

  MapRepository(this.service);

  Future<MapData> loadArea(double lat, double lon) async {
    try {
      final json = await service.getMapData(lat: lat, lon: lon);

      return MapParser.parse(json);
    } catch (e) {
      rethrow;
    }
  }
}
