import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/controller/map_controller.dart';
import 'package:travelerremake/features/map/models/camera_state.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/models/player.dart';

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
  final player = Player(position: const Offset(1500, 1500));

  double currentLat = 48.7758;
  double currentLon = 9.1829;

  bool loading = true;

  int get discoveredBuildings {
    return controller.worldObjects
        .where((o) => o.type == MapObjectType.building && o.discovered)
        .length;
  }

  int get discoveredRoads {
    return controller.worldObjects
        .where((o) => o.type == MapObjectType.road && o.discovered)
        .length;
  }

  int get xp => discoveredBuildings * 10;

  int get level => (xp ~/ 100) + 1;

  double get levelProgress {
    final currentLevelXp = (level - 1) * 100;
    return (xp - currentLevelXp) / 100;
  }

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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Level $level • XP $xp",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "$discoveredBuildings Buildings",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "$discoveredRoads Roads",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(6),
              child: LinearProgressIndicator(
                value: levelProgress,
                minHeight: 6,
              ),
            ),
          ),
          body: MapViewport(
            controller: controller,
            camera: camera,
            player: player,
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
