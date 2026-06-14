import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/data/models/user_models.dart';
import 'package:travelerremake/features/discover/presentation/widgets/discover_user_tile.dart';
import 'package:travelerremake/features/discover/presentation/widgets/user_preview_sheet.dart';

class DiscoverUserList extends StatelessWidget {
  final String searchQuery;

  const DiscoverUserList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final users = [
      User(
        id: 1,
        username: 'Ramajana',
        cityName: 'Stuttgart',
        level: 12,
        isOnline: true,
        countryName: 'Germany',
        distance: 5.2,
      ),
      User(
        id: 2,
        username: 'Max',
        cityName: 'Berlin',
        level: 1,
        isOnline: false,
        countryName: 'Germany',
        distance: 12.8,
      ),
    ];

    final filteredUsers = users.where((user) {
      return user.username.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return ListView.separated(
      itemCount: filteredUsers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final user = filteredUsers[index];

        return DiscoverUserTile(
          user: user,
          onTap: () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              builder: (_) {
                return UserPreviewSheet(user: user);
              },
            );
          },
        );
      },
    );
  }
}
