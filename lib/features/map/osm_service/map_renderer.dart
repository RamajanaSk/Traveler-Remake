import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/building_cache/building_model.dart';
import 'package:travelerremake/features/map/building_cache/building_painter.dart';

class MapRenderer extends StatelessWidget {
  final List<BuildingModel> buildings;

  const MapRenderer({super.key, required this.buildings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BuildingPainter(buildings: buildings),
        child: Container(),
      ),
    );
  }
}
