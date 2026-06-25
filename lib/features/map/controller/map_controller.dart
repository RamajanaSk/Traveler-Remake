import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:travelerremake/features/map/models/loading_state.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/models/player_stats.dart';
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
  final Map<String, DateTime> failedChunks = {};

  double minLat = double.infinity;
  double maxLat = -double.infinity;

  double minLon = double.infinity;
  double maxLon = -double.infinity;

  LoadingState loadingState = LoadingState.initialLoading;
  bool isLoadingChunks = false;
  String? errorMessage;

  bool _requestInProgress = false;

  Future<void> initialize() async {
    await loadChunk(lat: 48.7758, lon: 9.1829);
  }

  void updateDiscovery(Offset playerPosition, double discoverRadius) {
    final converter = MapConverter();

    final discoveredSomething = DiscoveryService.update(
      objects: worldObjects,
      playerPosition: playerPosition,
      discoverRadius: 550,
      converter: converter,
    );

    if (discoveredSomething) {
      notifyListeners();
    }
  }

  PlayerStats get stats => PlayerStats(worldObjects);

  Future<void> loadChunk({required double lat, required double lon}) async {
    final chunkKey = "${lat.toStringAsFixed(3)}_${lon.toStringAsFixed(3)}";

    // Already loaded
    if (loadedChunks.contains(chunkKey)) {
      return;
    }

    // Skip if another request is running
    if (_requestInProgress) {
      debugPrint("Another request is already running.");
      return;
    }

    // Skip recently failed chunk
    final lastFailure = failedChunks[chunkKey];
    if (lastFailure != null &&
        DateTime.now().difference(lastFailure).inSeconds < 30) {
      debugPrint("Skipping recently failed chunk $chunkKey");
      return;
    }

    _requestInProgress = true;

    if (loadingState == LoadingState.initialLoading) {
      notifyListeners();
    } else {
      isLoadingChunks = true;
      notifyListeners();
    }

    loadedChunks.add(chunkKey);

    try {
      final json = await service.getMapData(lat: lat, lon: lon);

      failedChunks.remove(chunkKey);

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

      loadingState = LoadingState.ready;
      isLoadingChunks = false;
      errorMessage = null;

      notifyListeners();

      debugPrint("Loaded chunk $chunkKey -> ${objects.length} objects");
    } catch (e) {
      failedChunks[chunkKey] = DateTime.now();

      loadedChunks.remove(chunkKey);

      isLoadingChunks = false;
      errorMessage = e.toString();

      loadingState = LoadingState.error;

      notifyListeners();

      debugPrint("Chunk $chunkKey failed: $e");
    } finally {
      _requestInProgress = false;
    }
  }

  Future<void> retryChunk({required double lat, required double lon}) async {
    loadingState = LoadingState.initialLoading;
    errorMessage = null;
    isLoadingChunks = false;

    notifyListeners();

    final chunkKey = "${lat.toStringAsFixed(3)}_${lon.toStringAsFixed(3)}";

    loadedChunks.remove(chunkKey);
    failedChunks.remove(chunkKey);

    await loadChunk(lat: lat, lon: lon);
  }
}
