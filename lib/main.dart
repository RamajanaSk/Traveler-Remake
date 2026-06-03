import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_theme.dart';
import 'package:travelerremake/core/widgets/bar/bottombar/traveler_bottom_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TravelerApp());
}

class TravelerApp extends StatelessWidget {
  const TravelerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: TravelerBottomBar(username: 'Ramajana', userId: '123'),
    );
  }
}
