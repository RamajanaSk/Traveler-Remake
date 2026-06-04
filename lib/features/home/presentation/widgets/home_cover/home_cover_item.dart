import 'package:flutter/material.dart';

class HomeCoverItem {
  final String badge;
  final String title;
  final String titleBelow;
  final String subtitle;
  final String actionText;
  final IconData actionIcon;
  final VoidCallback? onTap;

  const HomeCoverItem({
    required this.badge,
    required this.title,
    required this.titleBelow,
    required this.subtitle,
    required this.actionText,
    required this.actionIcon,
    this.onTap,
  });
}
