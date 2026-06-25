import 'dart:math';

import 'package:flutter/material.dart';

class SpaceBackground extends StatefulWidget {
  final Widget child;

  const SpaceBackground({super.key, required this.child});

  @override
  State<SpaceBackground> createState() => _SpaceBackgroundState();
}

class _SpaceBackgroundState extends State<SpaceBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final Random random = Random(1);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final glowOffset = controller.value * 30;

        final pulse = 1 + sin(controller.value * pi * 2) * 0.05;
        final opacity = 0.55 + sin(controller.value * pi * 2) * 0.08;

        return Stack(
          children: [
            //----------------------------------------------------
            // Background Gradient
            //----------------------------------------------------
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.9, -0.9),
                  radius: 1.6,
                  colors: [
                    Color(0xff49D8FF),
                    Color(0xff2557F5),
                    Color(0xff17124E),
                    Color(0xff080B1B),
                    Color(0xff03040B),
                  ],
                  stops: [0.0, 0.18, 0.45, 0.78, 1.0],
                ),
              ),
            ),
            //----------------------------------------------------
            // Cyan Glow
            //----------------------------------------------------
            Positioned(
              top: -260 + glowOffset,
              right: -220,
              child: IgnorePointer(
                child: Container(
                  width: 1100,
                  height: 1100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(0x662EDBFF),
                        Color(0x332EDBFF),
                        Color(0x112EDBFF),
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.25, 0.55, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            //----------------------------------------------------
            // Purple Glow
            //----------------------------------------------------
            //----------------------------------------------------
            // Purple Glow
            //----------------------------------------------------
            Positioned(
              top: 120,
              right: 40,
              child: Transform.rotate(
                angle: -.55,
                child: Container(
                  width: 130,
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0)],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(child: SafeArea(child: widget.child)),
          ],
        );
      },
    );
  }
}
