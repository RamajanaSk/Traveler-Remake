import 'package:travelerremake/features/map/osm_service/map_point.dart';

class BuildingModel {
  final String id;
  final List<MapPoint> points;

  const BuildingModel({required this.id, required this.points});
}
