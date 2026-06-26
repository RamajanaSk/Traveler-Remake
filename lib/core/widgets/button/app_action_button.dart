import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_colors.dart';

class AppActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool filled;
  final VoidCallback? onPressed;

  const AppActionButton({
    super.key,
    required this.text,
    required this.icon,
    this.filled = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: filled
                ? const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  )
                : null,
            color: filled ? null : Colors.white.withOpacity(.04),
            border: Border.all(
              color: filled
                  ? Colors.transparent
                  : Colors.white.withOpacity(.12),
            ),
            boxShadow: filled
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(.35),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
