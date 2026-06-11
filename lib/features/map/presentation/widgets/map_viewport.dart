import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:travelerremake/features/map/painter/map_painter.dart';

import '../../controller/map_controller.dart';
import '../../models/camera_state.dart';

class MapViewport extends StatelessWidget {
  final MapController controller;
  final CameraState camera;

  final VoidCallback onCameraChanged;

  const MapViewport({
    super.key,
    required this.controller,
    required this.camera,
    required this.onCameraChanged,
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

            onCameraChanged();
          }
        },
        child: SizedBox.expand(
          child: CustomPaint(
            painter: MapPainter(
              objects: controller.worldObjects,
              cameraPosition: camera.position,
              zoom: camera.zoom,
              minLat: controller.minLat,
              maxLat: controller.maxLat,
              minLon: controller.minLon,
              maxLon: controller.maxLon,
            ),
          ),
        ),
      ),
    );
  }
}
