import 'package:flutter/material.dart';

class TravelerCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;

  const TravelerCard({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ?? Colors.white.withValues(alpha: 0.04),
        ),
      ),
      child: child,
    );
  }
}
