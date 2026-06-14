import 'package:flutter/material.dart';
import 'package:travelerremake/core/services/app_services.dart';
import 'package:travelerremake/core/theme/app_theme.dart';
import 'package:travelerremake/core/widgets/bar/bottombar/traveler_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppServices.mapController.loadChunk(lat: 48.7758, lon: 9.1829);

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
