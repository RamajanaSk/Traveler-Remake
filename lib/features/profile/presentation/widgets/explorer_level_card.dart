import 'package:flutter/material.dart';

class ExplorerLevelCard extends StatelessWidget {
  const ExplorerLevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff171C24),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------- Avatar ----------------
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white54, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
              ),

              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xff45D76A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.black, size: 16),
                ),
              ),
            ],
          ),

          const SizedBox(width: 18),

          //---------------- Right ----------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ramajana ✨",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  "Explorer",
                  style: TextStyle(
                    color: Color(0xff45D76A),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 22),

                Row(
                  children: [
                    const Text(
                      "Level 12",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      "1660 / 2000 XP",
                      style: TextStyle(color: Colors.white.withOpacity(.7)),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: LinearProgressIndicator(
                    minHeight: 8,
                    value: .83,
                    backgroundColor: Colors.white12,
                    valueColor: const AlwaysStoppedAnimation(Color(0xff45D76A)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
