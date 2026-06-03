import 'package:flutter/material.dart';
import 'package:travelerremake/features/map/osm_service/osm_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final service = OSMService();

  bool loading = true;
  String? error;

  Map<String, dynamic>? json;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      json = await service.getMapData(lat: 48.7758, lon: 9.1829);
    } catch (e) {
      error = e.toString();
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(body: Center(child: Text(error!)));
    }

    final elements = json?["elements"] as List<dynamic>? ?? [];

    final buildingWays = elements.where((element) {
      return element["type"] == "way" &&
          element["tags"] != null &&
          element["tags"]["building"] != null;
    }).toList();

    final roadWays = elements.where((element) {
      return element["type"] == "way" &&
          element["tags"] != null &&
          element["tags"]["highway"] != null;
    }).toList();

    final trees = elements.where((element) {
      return element["type"] == "node" &&
          element["tags"] != null &&
          element["tags"]["natural"] == "tree";
    }).toList();

    final parks = elements.where((element) {
      return element["type"] == "way" &&
          element["tags"] != null &&
          element["tags"]["leisure"] == "park";
    }).toList();

    final amenities = elements.where((element) {
      return element["type"] == "node" &&
          element["tags"] != null &&
          element["tags"]["amenity"] != null;
    }).toList();

    final tourism = elements.where((element) {
      return element["type"] == "node" &&
          element["tags"] != null &&
          element["tags"]["tourism"] != null;
    }).toList();

    print("Buildings: ${buildingWays.length}");
    print("Roads: ${roadWays.length}");
    print("Trees: ${trees.length}");
    print("Parks: ${parks.length}");
    print("Amenities: ${amenities.length}");
    print("Tourism: ${tourism.length}");

    return Scaffold(
      appBar: AppBar(title: Text("Buildings (${buildingWays.length})")),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Elements: ${elements.length}",
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 8),

                Text(
                  "Buildings: ${buildingWays.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Roads: ${roadWays.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Trees: ${trees.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: roadWays.length,
              itemBuilder: (context, index) {
                final road = roadWays[index];

                final tags = road["tags"] as Map<String, dynamic>?;

                return ListTile(
                  leading: const Icon(Icons.route),

                  title: Text(tags?["name"] ?? "Unnamed Road"),

                  subtitle: Text(tags?["highway"] ?? "Unknown"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
