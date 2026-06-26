import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/data/models/user_models.dart';
import 'package:travelerremake/features/discover/presentation/widgets/user_preview/user_action_button.dart';
import 'package:travelerremake/features/discover/presentation/widgets/user_preview/user_avatar.dart';
import 'package:travelerremake/features/discover/presentation/widgets/user_preview/user_info_row.dart';
import 'package:travelerremake/features/discover/presentation/widgets/user_preview/user_level_badge.dart';
import 'package:travelerremake/features/discover/presentation/widgets/user_preview/user_stats_card.dart';

class UserPreviewSheet extends StatelessWidget {
  final User user;

  const UserPreviewSheet({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          UserAvatar(username: user.username),
          const SizedBox(height: 18),

          Text(user.username, style: Theme.of(context).textTheme.headlineSmall),

          const SizedBox(height: 8),

          UserLevelBadge(level: user.level),

          const SizedBox(height: 18),

          //UserInfoRow(user: user),

          //const SizedBox(height: 28),
          const UserStatsCard(),

          const SizedBox(height: 28),

          const UserActionButtons(),
        ],
      ),
    );
  }
}
