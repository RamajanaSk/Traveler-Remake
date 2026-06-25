import 'package:flutter/material.dart';
import 'package:travelerremake/core/services/app_services.dart';
import 'package:travelerremake/core/widgets/loading_widget.dart';

import 'package:travelerremake/features/map/models/camera_state.dart';
import 'package:travelerremake/features/map/models/map_object_type.dart';
import 'package:travelerremake/features/map/models/player.dart';
import 'package:travelerremake/features/map/presentation/widgets/level_card.dart';
import 'package:travelerremake/features/map/presentation/widgets/map_error_widget.dart';

import 'package:travelerremake/features/map/presentation/widgets/map_viewport.dart';
import 'package:travelerremake/features/map/services/chunk_loader.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = AppServices.mapController;
  final camera = CameraState(position: const Offset(0, 0), zoom: 0.02);
  final player = Player(worldPosition: const Offset(0, 0));

  double currentLat = 48.7758;
  double currentLon = 9.1829;

  bool loading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkChunks() async {
    try {
      await ChunkLoader.check(
        cameraPosition: camera.position,
        currentLat: currentLat,
        currentLon: currentLon,
        loadChunk: (lat, lon) {
          return controller.loadChunk(lat: lat, lon: lon);
        },
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> retry() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    //await loadWorld();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (loading) {
      return const MapLoadingWidget();
    }

    if (errorMessage != null) {
      return MapErrorWidget(errorMessage: errorMessage!, onRetry: retry);
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final stats = controller.stats;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(370),
            child: SafeArea(
              child: LevelCard(
                level: stats.level,
                currentXp: stats.currentLevelXp,
                maxXp: stats.maxLevelXp,
              ),
            ),
          ),
          body: MapViewport(
            controller: controller,
            camera: camera,
            player: player,
            onCameraChanged: () async {
              await checkChunks();

              if (mounted) {
                setState(() {});
              }
            },
          ),
        );
      },
    );
  }
}
