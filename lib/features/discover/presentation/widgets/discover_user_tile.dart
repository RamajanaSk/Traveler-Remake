import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/data/models/user_models.dart';

class DiscoverUserTile extends StatelessWidget {
  final User user;

  const DiscoverUserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            user.username.isNotEmpty ? user.username[0].toUpperCase() : '?',
          ),
        ),
        title: Text(user.username),
        subtitle: Text("${user.cityName}, ${user.countryName}"),
        trailing: Text("${user.distance.toStringAsFixed(1)} km"),
      ),
    );
  }
}
