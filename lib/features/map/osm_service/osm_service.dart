import 'dart:convert';
import 'package:http/http.dart' as http;

class OSMService {
  static const String overpassUrl = "https://overpass-api.de/api/interpreter";

  Future<Map<String, dynamic>> getMapData({
    required double lat,
    required double lon,
    double radius = 50,
  }) async {
    try {
      final query =
          """
[out:json][timeout:90];

(
  way["building"](around:$radius,$lat,$lon);

  way["highway"](around:$radius,$lat,$lon);

  node["natural"="tree"](around:$radius,$lat,$lon);

  way["leisure"="park"](around:$radius,$lat,$lon);

  node["amenity"](around:$radius,$lat,$lon);

  node["tourism"](around:$radius,$lat,$lon);
);

(._;>;);

out body;
""";

      final response = await http.post(Uri.parse(overpassUrl), body: query);

      if (response.statusCode != 200) {
        throw Exception("Overpass Error: ${response.statusCode}");
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      print("Elements: ${json["elements"]?.length}");

      return json;
    } catch (e) {
      throw Exception("Failed to fetch OSM data: $e");
    }
  }
}
