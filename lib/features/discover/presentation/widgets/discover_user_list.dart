import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/data/models/user_models.dart';
import 'package:travelerremake/features/discover/presentation/widgets/discover_user_tile.dart';

class DiscoverUserList extends StatelessWidget {
  const DiscoverUserList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      User(
        id: 1,
        username: 'Ramajana',
        cityName: 'Stuttgart',
        countryName: 'Germany',
        distance: 5.2,
      ),
      User(
        id: 2,
        username: 'Max',
        cityName: 'Berlin',
        countryName: 'Germany',
        distance: 12.8,
      ),
    ];

    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        return DiscoverUserTile(user: users[index]);
      },
    );
  }
}
