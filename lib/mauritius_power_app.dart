import 'package:flutter/material.dart';
import 'package:mauritius_power_app/screens/navigation_screen.dart';

class MauritiusPowerApp extends StatelessWidget {
  const MauritiusPowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mauritius Power App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const NavigationScreen(),
    );
  }
}
