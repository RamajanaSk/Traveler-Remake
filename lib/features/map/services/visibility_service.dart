import 'package:flutter/material.dart';

class VisibilityService {
  static bool isVisible({
    required Offset position,
    required Offset cameraPosition,
    required Size screenSize,
    required double zoom,
  }) {
    final viewWidth = screenSize.width / zoom;
    final viewHeight = screenSize.height / zoom;

    return position.dx > cameraPosition.dx - viewWidth &&
        position.dx < cameraPosition.dx + viewWidth &&
        position.dy > cameraPosition.dy - viewHeight &&
        position.dy < cameraPosition.dy + viewHeight;
  }
}
