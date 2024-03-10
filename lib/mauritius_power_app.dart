import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritius_power_app/bloc/power_outage/power_outage_bloc.dart';
import 'package:mauritius_power_app/repositories/power_outage_repository.dart';
import 'package:mauritius_power_app/screens/navigation_screen.dart';

class MauritiusPowerApp extends StatelessWidget {
  final PowerOutageRepository powerOutageRepository;

  const MauritiusPowerApp({super.key, required this.powerOutageRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: powerOutageRepository,
      child: BlocProvider(
        create: (context) => PowerOutageBloc(
            powerOutageRepository: context.read<PowerOutageRepository>()),
        child: MaterialApp(
          title: 'Mauritius Power App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const NavigationScreen(),
        ),
      ),
    );
  }
}
