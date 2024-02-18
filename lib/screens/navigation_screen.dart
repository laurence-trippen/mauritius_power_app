import 'package:flutter/material.dart';
import 'package:mauritius_power_app/screens/list_screen.dart';
import 'package:mauritius_power_app/screens/map_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentPageIndex = 0;

  final _navigationEntries = <_NavigationEntry>[
    _NavigationEntry(
      label: "Map",
      iconData: Icons.location_on,
      screen: const MapScreen(),
    ),
    _NavigationEntry(
      label: "Outages",
      iconData: Icons.bolt,
      screen: const ListScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final currentEntry = _navigationEntries[_currentPageIndex];

    return Scaffold(
      body: <Widget>[
        ..._navigationEntries.map((entry) => entry.screen),
      ][_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int newPageIndex) {
          setState(() {
            _currentPageIndex = newPageIndex;
          });
        },
        destinations: <Widget>[
          ..._navigationEntries.map((entry) => NavigationDestination(
                icon: Icon(entry.iconData),
                label: entry.label,
              ))
        ],
      ),
    );
  }
}

class _NavigationEntry {
  final String label;
  final IconData iconData;
  final Widget screen;
  final Widget? customLeading;

  _NavigationEntry({
    required this.label,
    required this.iconData,
    required this.screen,
    this.customLeading,
  });
}
