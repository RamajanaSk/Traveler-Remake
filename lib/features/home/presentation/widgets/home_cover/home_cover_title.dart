import 'package:flutter/material.dart';

class HomeCoverTitle extends StatelessWidget {
  const HomeCoverTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Adventure\n",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              height: 1,
            ),
          ),

          TextSpan(
            text: "starts outside.",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
