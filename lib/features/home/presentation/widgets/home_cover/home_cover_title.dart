import 'package:flutter/material.dart';

class HomeCoverTitle extends StatelessWidget {
  const HomeCoverTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Adventure\n",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Colors.white,
            ),
          ),

          TextSpan(
            text: "starts outside.",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              height: 1,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF00CFFF), Color(0xFF4DA6FF)],
                ).createShader(const Rect.fromLTWH(0, 0, 300, 70)),
            ),
          ),
        ],
      ),
    );
  }
}
