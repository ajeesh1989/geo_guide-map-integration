import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? mapController;

  ValueNotifier<int> index = ValueNotifier(2);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Geolocation?> geolocation = ValueNotifier(
      Geolocation(
        const LatLng(37.7749, -122.4194),
        LatLngBounds(
          southwest: const LatLng(37.703399,
              -122.536138), // Southwest corner of San Francisco Bay Area
          northeast: const LatLng(
              38.315423, -121.884376), // Northeast corner of Sacramento, CA
        ),
      ),
    );
    final List collectMap = [
      MapType.satellite,
      MapType.hybrid,
      MapType.normal,
      MapType.terrain
    ];
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        actions: [
          const Center(
            child: Text(
              'Click here to change view',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.touch_app,
              color: Colors.white,
            ),
            onPressed: () {
              log(index.value.toString());
              if (index.value == 3) {
                index.value = 0;
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                index.notifyListeners();
              } else {
                index.value++;
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                index.notifyListeners();
              }
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.teal.shade900,
        title: const Text(
          'Google Maps',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: geolocation,
        builder: (context, value, child) => ValueListenableBuilder(
          valueListenable: index,
          builder: (context, value, child) => SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    height: 720,
                    child: GoogleMap(
                      onMapCreated: (GoogleMapController googleMapController) {
                        setState(
                          () {
                            mapController = mapController;
                          },
                        );
                      },
                      initialCameraPosition: const CameraPosition(
                        zoom: 10.0,
                        target: LatLng(11.2715, 76.2239),
                      ),
                      mapType: collectMap[value],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
