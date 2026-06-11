import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/controller/map_controller.dart';
import 'package:travelerremake/features/map/models/camera_state.dart';

import 'package:travelerremake/features/map/osm_parser.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';
import 'package:travelerremake/features/map/presentation/widgets/map_viewport.dart';
import 'package:travelerremake/features/map/services/chunk_loader.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final controller = MapController(service: OSMService(), parser: OSMParser());

  final camera = CameraState(position: const Offset(1500, 1500), zoom: 1);

  double currentLat = 48.7758;
  double currentLon = 9.1829;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadWorld();
  }

  Future<void> loadWorld() async {
    await controller.loadChunk(lat: currentLat, lon: currentLon);

    setState(() {
      loading = false;
    });
  }

  Future<void> checkChunks() async {
    await ChunkLoader.check(
      cameraPosition: camera.position,
      currentLat: currentLat,
      currentLon: currentLon,
      loadChunk: (lat, lon) {
        return controller.loadChunk(lat: lat, lon: lon);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Objects: ${controller.worldObjects.length}"),
          ),
          body: MapViewport(
            controller: controller,
            camera: camera,
            onCameraChanged: () async {
              await checkChunks();

              setState(() {});
            },
          ),
        );
      },
    );
  }
}
