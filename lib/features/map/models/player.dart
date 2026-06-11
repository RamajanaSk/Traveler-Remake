import 'dart:ui' show Offset;

class Player {
  Offset position;

  final double radius;

  Player({required this.position, this.radius = 20});
}
