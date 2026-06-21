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
          SizedBox(height: 15),

          UserLevelBadge(level: user.level),
          SizedBox(height: 15),

          UserInfoRow(user: user),
          SizedBox(height: 15),

          const UserStatsCard(),
          SizedBox(height: 15),

          const UserActionButtons(),
          SizedBox(height: 15),
          SizedBox(height: 15),
          SizedBox(height: 15),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
