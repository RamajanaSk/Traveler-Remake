import 'dart:ui';

class CameraState {
  Offset position;
  double zoom;

  CameraState({required this.position, required this.zoom});

  void move(Offset delta) {
    position -= delta / zoom;
  }

  void zoomIn() {
    zoom *= 1.15;
    zoom = zoom.clamp(0.01, 10.0);
  }

  void zoomOut() {
    zoom *= 0.85;
    zoom = zoom.clamp(0.01, 10.0);
  }
}
