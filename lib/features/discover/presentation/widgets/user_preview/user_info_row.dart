import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/data/models/user_models.dart';
import 'package:travelerremake/features/discover/presentation/widgets/card/info_card.dart';

class UserInfoRow extends StatelessWidget {
  final User user;

  const UserInfoRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InfoCard(
          icon: Icons.location_on_outlined,
          value: user.cityName,
          label: "City",
        ),

        InfoCard(icon: Icons.public, value: user.countryName, label: "Country"),

        InfoCard(
          icon: Icons.near_me,
          value: "${user.distance.toStringAsFixed(1)} km",
          label: "Away",
        ),
      ],
    );
  }
}
