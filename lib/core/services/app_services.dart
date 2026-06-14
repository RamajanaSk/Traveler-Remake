import 'package:travelerremake/features/map/controller/map_controller.dart';
import 'package:travelerremake/features/map/osm_parser.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';

class AppServices {
  static final mapController = MapController(
    service: OSMService(),
    parser: OSMParser(),
  );
}
