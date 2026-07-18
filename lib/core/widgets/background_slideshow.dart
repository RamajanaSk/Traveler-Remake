import 'dart:async';
import 'package:flutter/material.dart';

class BackgroundSlideshow extends StatefulWidget {
  const BackgroundSlideshow({super.key});

  @override
  State<BackgroundSlideshow> createState() => _BackgroundSlideshowState();
}

class _BackgroundSlideshowState extends State<BackgroundSlideshow> {
  int currentImage = 0;

  final images = const [
    "assets/images/mountains.png",
    "assets/images/nightlights.png",
  ];

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 10), (_) {
      setState(() {
        currentImage = (currentImage + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1200),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Image.asset(
        images[currentImage],
        key: ValueKey(images[currentImage]),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
