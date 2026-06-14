import 'package:flutter/material.dart';

class TravelerExplorerOverview extends StatelessWidget {
  const TravelerExplorerOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeroCard(),

          const SizedBox(height: 20),

          const Text(
            "TODAY",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Expanded(
                child: _TodayCard(
                  title: "Discoveries",
                  value: "+47",
                  icon: Icons.explore,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _TodayCard(title: "XP", value: "+120", icon: Icons.bolt),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            "REGION COMPLETION",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const _CompletionCard(
            title: "Buildings",
            current: 52,
            total: 230,
            icon: Icons.apartment,
          ),

          const SizedBox(height: 12),

          const _CompletionCard(
            title: "Roads",
            current: 87,
            total: 310,
            icon: Icons.route,
          ),

          const SizedBox(height: 12),

          const _CompletionCard(
            title: "Trees",
            current: 148,
            total: 980,
            icon: Icons.park,
          ),

          const SizedBox(height: 24),

          const Text(
            "ACHIEVEMENTS",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Expanded(
                child: _AchievementCard(
                  icon: Icons.forest,
                  title: "Forester",
                  progress: "148 / 500",
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _AchievementCard(
                  icon: Icons.location_city,
                  title: "Architect",
                  progress: "52 / 200",
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            "PERSONAL RECORDS",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const _RecordTile(
            icon: Icons.directions_walk,
            title: "Longest Exploration",
            value: "6.4 km",
          ),

          const _RecordTile(
            icon: Icons.local_fire_department,
            title: "Best Streak",
            value: "12 Days",
          ),

          const _RecordTile(
            icon: Icons.explore,
            title: "Most Discoveries In One Day",
            value: "103",
          ),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF161B22),
      ),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
              ),
            ),
            child: const Icon(Icons.explore, size: 44, color: Colors.white),
          ),

          const SizedBox(height: 20),

          const Text(
            "LEVEL 8",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text("Explorer", style: TextStyle(color: Colors.white70)),

          const SizedBox(height: 20),

          const Text(
            "287 Discoveries",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: const LinearProgressIndicator(value: 0.62, minHeight: 10),
          ),

          const SizedBox(height: 8),

          const Text(
            "23% of your region explored",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _TodayCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _TodayCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(title),
        ],
      ),
    );
  }
}

class _CompletionCard extends StatelessWidget {
  final String title;
  final int current;
  final int total;
  final IconData icon;

  const _CompletionCard({
    required this.title,
    required this.current,
    required this.total,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final progress = current / total;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(title),
              const Spacer(),
              Text("$current / $total"),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(value: progress),
        ],
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String progress;

  const _AchievementCard({
    required this.icon,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(progress),
        ],
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _RecordTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
