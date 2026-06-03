import 'package:flutter/material.dart';
import 'package:travelerremake/features/discover/presentation/widgets/qr_button.dart';

class DiscoverSearchBar extends StatelessWidget {
  const DiscoverSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search traveler...",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),

        SizedBox(width: 12),

        QrButton(),
      ],
    );
  }
}
