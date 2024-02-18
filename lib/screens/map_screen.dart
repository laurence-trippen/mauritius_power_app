import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;

  @override
  void initState() {
    _mapController = MapController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(-20.277331949289284, 57.55984267121932),
              initialZoom: 10,
            ),
            mapController: _mapController,
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'de.divakom.biebrichbewegtapp',
                retinaMode:
                    true, // TODO: Check if device retina must be queried.
                // TODO: Add Map-Cache Store
                // tileProvider: CachedTileProvider(
                //   store: cacheStore,
                // ),
              ),
            ]),
      ],
    );
  }
}
