import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:travelerremake/features/map/models/player.dart';
import 'package:travelerremake/features/map/painter/map_painter.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

import '../../controller/map_controller.dart';
import '../../models/camera_state.dart';

class MapViewport extends StatelessWidget {
  final MapController controller;
  final CameraState camera;
  final Player player;

  final VoidCallback onCameraChanged;

  const MapViewport({
    super.key,
    required this.controller,
    required this.camera,
    required this.onCameraChanged,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          if (pointerSignal.scrollDelta.dy > 0) {
            camera.zoomOut();
          } else {
            camera.zoomIn();
          }

          onCameraChanged();
        }
      },
      child: GestureDetector(
        onScaleUpdate: (details) {
          if (details.pointerCount == 1) {
            camera.move(details.focalPointDelta);

            controller.updateDiscovery(camera.position, player.radius);

            onCameraChanged();
          }
        },
        child: SizedBox.expand(
          child: CustomPaint(
            painter: MapPainter(
              objects: controller.worldObjects,
              cameraPosition: camera.position,
              zoom: camera.zoom,
              player: player,
              converter: MapConverter(),
            ),
          ),
        ),
      ),
    );
  }
}
