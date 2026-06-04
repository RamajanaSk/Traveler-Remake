import 'package:flutter/material.dart';

class QrButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const QrButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 52,
        height: 52,

        child: const Icon(
          Icons.qr_code_scanner_outlined,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 25,
        ),
      ),
    );
  }
}
