import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String username;

  const UserAvatar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(
          colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
        ),
      ),
      child: Center(
        child: Text(
          username[0].toUpperCase(),
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
