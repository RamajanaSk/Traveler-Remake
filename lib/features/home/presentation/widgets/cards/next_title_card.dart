import 'package:flutter/material.dart';

class NextTitleCard extends StatelessWidget {
  final String currentTitle;
  final String nextTitle;
  final int remainingDiscoveries;
  final int currentProgress;
  final int requiredDiscoveries;

  const NextTitleCard({
    super.key,
    required this.currentTitle,
    required this.nextTitle,
    required this.remainingDiscoveries,
    required this.currentProgress,
    required this.requiredDiscoveries,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentProgress / requiredDiscoveries).clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181C24),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
            child: Column(
              children: [
                /// Header
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xff45D76A).withOpacity(.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.workspace_premium_rounded,
                        color: Color(0xff45D76A),
                        size: 22,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Text(
                        "Next Title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.05),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "$remainingDiscoveries left",
                        style: const TextStyle(
                          color: Color(0xff45D76A),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Titles
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            "Current",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white30,
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            nextTitle,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Color(0xff45D76A),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            "Unlock",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.6),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Bottom info
                Row(
                  children: [
                    Text(
                      "$currentProgress / $requiredDiscoveries discoveries",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.65),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      "${(progress * 100).round()}%",
                      style: const TextStyle(
                        color: Color(0xff45D76A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Bottom Progress Bar
          SizedBox(
            height: 5,
            width: double.infinity,
            child: Stack(
              children: [
                Container(color: Colors.white.withOpacity(.05)),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(color: const Color(0xff45D76A)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
