import 'dart:convert';
import 'package:http/http.dart' as http;

class OSMService {
  static const String overpassUrl = "https://overpass-api.de/api/interpreter";

  Future<Map<String, dynamic>> getMapData({
    required double lat,
    required double lon,
    double radius = 600,
  }) async {
    try {
      final query =
          """
[out:json][timeout:90];

(
  way["building"](around:$radius,$lat,$lon);

  way["highway"](around:$radius,$lat,$lon);

  way["leisure"="park"](around:$radius,$lat,$lon);

  node["amenity"](around:$radius,$lat,$lon);

  node["tourism"](around:$radius,$lat,$lon);
  way["water"](around:$radius,$lat,$lon);

  way["natural"="water"](around:$radius,$lat,$lon);

  way["landuse"="forest"](around:$radius,$lat,$lon);

  way["landuse"="grass"](around:$radius,$lat,$lon);

  way["landuse"="meadow"](around:$radius,$lat,$lon);

  way["natural"="grassland"](around:$radius,$lat,$lon);

  way["railway"](around:$radius,$lat,$lon);

  node["historic"](around:$radius,$lat,$lon);

  node["memorial"](around:$radius,$lat,$lon);

  node["tourism"="viewpoint"](around:$radius,$lat,$lon);

  node["amenity"="restaurant"](around:$radius,$lat,$lon);

  node["amenity"="cafe"](around:$radius,$lat,$lon);

  node["amenity"="bar"](around:$radius,$lat,$lon);

  node["shop"](around:$radius,$lat,$lon);
);

(._;>;);

out body;
""";

      final response = await http.post(
        Uri.parse(overpassUrl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "text/plain",
          "User-Agent": "Traveler (mydomain.de)",
          "Referer": "https://mydomain.de",
        },
        body: query,
      );

      if (response.statusCode != 200) {
        throw Exception("Overpass Error: ${response.statusCode}");
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      print("Elements: ${json["elements"]?.length}");

      return json;
    } catch (e, st) {
      print("========== OSM ERROR ==========");
      print(e);
      print(st);
      rethrow;
    }
  }
}
