import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/data/models/user_models.dart';
import 'package:travelerremake/features/discover/presentation/widgets/card/info_card.dart';

class UserInfoRow extends StatelessWidget {
  final User user;

  const UserInfoRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InfoCard(
            icon: Icons.location_on_outlined,
            value: user.cityName,
            label: "City",
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InfoCard(
            icon: Icons.public,
            value: user.countryName,
            label: "Country",
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InfoCard(
            icon: Icons.near_me_rounded,
            value: "${user.distance.toStringAsFixed(1)} km",
            label: "Away",
          ),
        ),
      ],
    );
  }
}
