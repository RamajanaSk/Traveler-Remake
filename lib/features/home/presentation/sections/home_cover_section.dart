import 'package:flutter/material.dart';
import 'package:travelerremake/features/home/presentation/widgets/home_cover/home_cover_card.dart';

class HomeCoverSection extends StatelessWidget {
  const HomeCoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(32)),
      child: Stack(children: [HomeCoverCard()]),
    );
  }
}
