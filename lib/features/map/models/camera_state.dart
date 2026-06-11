import 'dart:ui';

class CameraState {
  Offset position;
  double zoom;

  CameraState({required this.position, required this.zoom});

  void move(Offset delta) {
    position -= delta / zoom;
  }

  void zoomIn() {
    zoom *= 1.1;
    zoom = zoom.clamp(1.0, 3.0);
  }

  void zoomOut() {
    zoom *= 0.9;
    zoom = zoom.clamp(1.0, 3.0);
  }
}
