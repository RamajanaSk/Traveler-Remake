import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:travelerremake/features/map/models/player.dart';
import 'package:travelerremake/features/map/painter/map_painter.dart';
import 'package:travelerremake/features/map/utils/map_converter.dart';

import '../../controller/map_controller.dart';
import '../../models/camera_state.dart';

class MapViewport extends StatefulWidget {
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
  State<MapViewport> createState() => _MapViewportState();
}

class _MapViewportState extends State<MapViewport> {
  double _lastScale = 1.0;
  bool _isZooming = false;
  bool _isPinching = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          if (pointerSignal.scrollDelta.dy > 0) {
            widget.camera.zoomOut();
          } else {
            widget.camera.zoomIn();
          }

          widget.onCameraChanged();
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onScaleStart: (details) {
          _lastScale = 1.0;
          _isZooming = false;
        },

        onScaleUpdate: (details) {
          if (details.pointerCount >= 2) {
            // Erster Frame nach dem Aufsetzen des zweiten Fingers
            if (!_isPinching) {
              _isPinching = true;
              _lastScale = details.scale;
              return;
            }

            final scaleDelta = details.scale / _lastScale;

            _lastScale = details.scale;

            widget.camera.zoom *= scaleDelta;
            widget.camera.zoom = widget.camera.zoom.clamp(0.015, 0.05);
          } else {
            _isPinching = false;

            widget.camera.move(details.focalPointDelta);

            widget.controller.updateDiscovery(
              widget.camera.position,
              widget.player.radius,
            );
          }

          widget.onCameraChanged();
        },

        child: SizedBox.expand(
          child: CustomPaint(
            painter: MapPainter(
              objects: widget.controller.worldObjects,
              cameraPosition: widget.camera.position,
              zoom: widget.camera.zoom,
              player: widget.player,
              converter: MapConverter(),
            ),
          ),
        ),
      ),
    );
  }
}
