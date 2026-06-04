import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/map_object_type.dart';
import 'package:travelerremake/features/map/map_painter.dart';
import 'package:travelerremake/features/map/osm_parser.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final OSMService service = OSMService();
  final OSMParser parser = OSMParser();

  bool loading = true;
  String? error;

  List<MapObject> worldObjects = [];

  @override
  void initState() {
    super.initState();
    loadWorld();
  }

  Future<void> loadWorld() async {
    try {
      final json = await service.getMapData(lat: 48.7758, lon: 9.1829);

      worldObjects = parser.parse(json);

      debugPrint("Loaded ${worldObjects.length} world objects");

      for (final object in worldObjects) {
        switch (object.type) {
          case MapObjectType.building:
            debugPrint("Building with ${object.points.length} points");
            break;

          case MapObjectType.road:
            debugPrint("Road with ${object.points.length} points");
            break;

          case MapObjectType.tree:
            debugPrint("Tree");
            break;

          case MapObjectType.park:
            debugPrint("Park");
            break;
        }
      }
    } catch (e) {
      error = e.toString();
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(body: Center(child: Text(error!)));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Objects: ${worldObjects.length}")),
      body: SizedBox.expand(
        child: CustomPaint(painter: MapPainter(objects: worldObjects)),
      ),
    );
  }
}
