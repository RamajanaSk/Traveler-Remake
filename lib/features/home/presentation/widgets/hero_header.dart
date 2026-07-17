import 'package:flutter/material.dart';

class HomeHeroHeader extends StatelessWidget {
  const HomeHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// Background
          Image.asset("assets/images/profile.jpg", fit: BoxFit.cover),

          /// Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x44000000),
                  Colors.transparent,
                  Color(0xDD000000),
                ],
              ),
            ),
          ),

          /// Greeting
          Positioned(
            top: 24,
            left: 22,
            right: 22,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),

                const SizedBox(width: 12),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Evening",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),

                    SizedBox(height: 2),

                    Text(
                      "Ramajana ✨",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.notifications_none, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          /// Title
          const Positioned(
            left: 22,
            right: 22,
            bottom: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Traveler",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 54,
                    fontWeight: FontWeight.w900,
                    height: .9,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Adventure starts outside.",
                  style: TextStyle(color: Colors.white70, fontSize: 17),
                ),
              ],
            ),
          ),

          /// Button
          Positioned(
            left: 22,
            right: 22,
            bottom: 24,
            child: SizedBox(
              height: 58,
              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.explore),

                label: const Text(
                  "Continue Exploring",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff39B55D),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
