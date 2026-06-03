import 'package:flutter/material.dart';

class QrButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const QrButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Icon(
          Icons.qr_code_scanner_rounded,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
