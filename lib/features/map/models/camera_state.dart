import 'dart:ui';

class CameraState {
  Offset position;
  double zoom;

  CameraState({required this.position, required this.zoom});

  void move(Offset delta) {
    position -= delta / zoom;
  }

  void zoomIn() {
    zoom *= 1.10;
    zoom = zoom.clamp(0.25, 0.60);
  }

  void zoomOut() {
    zoom *= 0.90;
    zoom = zoom.clamp(0.25, 0.60);
  }
}
