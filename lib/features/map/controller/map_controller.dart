import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/osm_parser.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';
import 'package:travelerremake/features/map/services/discovery_service.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

class MapController extends ChangeNotifier {
  final OSMService service;
  final OSMParser parser;

  MapController({required this.service, required this.parser});

  final List<MapObject> worldObjects = [];
  final Set<String> loadedChunks = {};

  double minLat = double.infinity;
  double maxLat = -double.infinity;

  double minLon = double.infinity;
  double maxLon = -double.infinity;

  bool loadingChunk = false;
  void updateDiscovery(Offset playerPosition) {
    final converter = MapConverter(
      minLat: minLat,
      maxLat: maxLat,
      minLon: minLon,
      maxLon: maxLon,
    );

    final discoveredSomething = DiscoveryService.update(
      objects: worldObjects,
      playerPosition: playerPosition,
      converter: converter,
    );

    if (discoveredSomething) {
      notifyListeners();
    }
  }

  Future<void> loadChunk({required double lat, required double lon}) async {
    final chunkKey = "${lat.toStringAsFixed(3)}_${lon.toStringAsFixed(3)}";

    if (loadedChunks.contains(chunkKey)) {
      return;
    }

    loadedChunks.add(chunkKey);

    try {
      final json = await service.getMapData(lat: lat, lon: lon);

      final objects = parser.parse(json);

      for (final object in objects) {
        for (final point in object.points) {
          minLat = point.lat < minLat ? point.lat : minLat;
          maxLat = point.lat > maxLat ? point.lat : maxLat;

          minLon = point.lon < minLon ? point.lon : minLon;
          maxLon = point.lon > maxLon ? point.lon : maxLon;
        }
      }

      worldObjects.addAll(objects);

      notifyListeners();

      debugPrint("Loaded chunk $chunkKey -> ${objects.length} objects");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
