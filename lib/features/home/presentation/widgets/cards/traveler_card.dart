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
        borderRadius: BorderRadius.circular(15),

        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 36, 36, 36),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),

      child: child,
    );
  }
}
