import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  final int level;
  final int currentXp;
  final int maxXp;

  const LevelCard({
    super.key,
    required this.level,
    required this.currentXp,
    required this.maxXp,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentXp / maxXp;

    return SizedBox(
      height: 90,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final h = constraints.maxHeight;

          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: h * 0.15,
                      vertical: h * 0.1,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: h * 0.55,
                          height: h * 0.55,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF00D4FF,
                            ).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.travel_explore,
                            color: Color(0xFF00D4FF),
                          ),
                        ),

                        SizedBox(width: h * 0.15),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LEVEL $level',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: h * 0.32,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),

                              SizedBox(height: h * 0.03),

                              Text(
                                '${currentXp}XP',
                                style: TextStyle(
                                  fontSize: h * 0.18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    minHeight: 10,
                    backgroundColor: Colors.lightBlue.shade100,
                    valueColor: AlwaysStoppedAnimation(
                      Colors.lightBlue.shade400,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
