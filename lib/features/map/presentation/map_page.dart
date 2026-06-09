import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/map_object_type.dart';
import 'package:travelerremake/features/map/map_painter.dart';
import 'package:travelerremake/features/map/osm_parser.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';
import 'package:flutter/gestures.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final OSMService service = OSMService();
  final OSMParser parser = OSMParser();

  bool loading = true;
  String? error;

  List<MapObject> worldObjects = [];

  double minLat = double.infinity;
  double maxLat = -double.infinity;

  double minLon = double.infinity;
  double maxLon = -double.infinity;

  final Set<String> loadedChunks = {};

  double currentLat = 48.7758;
  double currentLon = 9.1829;

  bool loadingChunk = false;

  Offset cameraPosition = const Offset(1500, 1500);

  double zoom = 1.0;

  double startZoom = 1.0;

  @override
  void initState() {
    super.initState();
    loadWorld();
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

      setState(() {
        worldObjects.addAll(objects);
      });

      debugPrint("Loaded chunk $chunkKey -> ${objects.length} objects");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> checkForChunkLoading() async {
    if (loadingChunk) return;

    loadingChunk = true;

    try {
      const movementStep = 0.01;

      if (cameraPosition.dy < 500) {
        await loadChunk(lat: currentLat + movementStep, lon: currentLon);
      }

      if (cameraPosition.dy > 2500) {
        await loadChunk(lat: currentLat - movementStep, lon: currentLon);
      }

      if (cameraPosition.dx < 500) {
        await loadChunk(lat: currentLat, lon: currentLon - movementStep);
      }

      if (cameraPosition.dx > 2500) {
        await loadChunk(lat: currentLat, lon: currentLon + movementStep);
      }
    } finally {
      loadingChunk = false;
    }
  }

  Future<void> loadWorld() async {
    try {
      await loadChunk(lat: currentLat, lon: currentLon);
    } catch (e) {
      error = e.toString();
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(body: Center(child: Text(error!)));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Objects: ${worldObjects.length}")),
      body: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            setState(() {
              if (pointerSignal.scrollDelta.dy > 0) {
                zoom *= 0.9;
              } else {
                zoom *= 1.1;
              }

              zoom = zoom.clamp(1.0, 3.0);
            });
          }
        },
        child: GestureDetector(
          onScaleStart: (details) {
            startZoom = zoom;
          },
          onScaleUpdate: (details) {
            setState(() {
              if (details.pointerCount == 1) {
                cameraPosition -= details.focalPointDelta / zoom;

                checkForChunkLoading();
              }
            });
          },
          child: SizedBox.expand(
            child: CustomPaint(
              painter: MapPainter(
                objects: worldObjects,
                cameraPosition: cameraPosition,
                zoom: zoom,
                minLat: minLat,
                maxLat: maxLat,
                minLon: minLon,
                maxLon: maxLon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
