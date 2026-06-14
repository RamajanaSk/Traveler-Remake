import 'package:travelerremake/features/map/models/map_object_type.dart';

class PlayerStats {
  final List<MapObject> objects;

  const PlayerStats(this.objects);

  int get discoveredBuildings => objects
      .where((o) => o.type == MapObjectType.building && o.discovered)
      .length;

  int get discoveredRoads =>
      objects.where((o) => o.type == MapObjectType.road && o.discovered).length;

  int get discoveredTrees =>
      objects.where((o) => o.type == MapObjectType.tree && o.discovered).length;

  int get xp {
    int result = 0;

    for (final object in objects) {
      if (!object.discovered) continue;

      switch (object.type) {
        case MapObjectType.building:
          result += 10;
          break;

        case MapObjectType.road:
          result += 2;
          break;

        case MapObjectType.tree:
          result += 1;
          break;

        default:
          result += 5;
      }
    }

    return result;
  }

  int get level => (xp ~/ 100) + 1;

  int get currentLevelXp => xp % 100;

  int get maxLevelXp => 100;
}
