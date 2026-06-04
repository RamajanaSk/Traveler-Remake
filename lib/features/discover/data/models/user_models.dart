class User {
  final int id;
  final String username;
  final String cityName;
  final String countryName;
  final double distance;
  final int level;
  final bool isOnline;

  const User({
    required this.id,
    required this.username,
    required this.cityName,
    required this.countryName,
    required this.distance,
    required this.level,
    required this.isOnline,
  });
}
