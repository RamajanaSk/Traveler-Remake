import 'package:flutter/material.dart';

class TravelerCard extends StatelessWidget {
  final Widget child;

  const TravelerCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF111827), Color(0xFF102A43)],
        ),

        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),

        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2147A6).withValues(alpha: 0.15),
            blurRadius: 25,
            spreadRadius: 1,
          ),
        ],
      ),

      child: child,
    );
  }
}
