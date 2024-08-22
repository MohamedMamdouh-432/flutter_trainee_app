import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:trainee/controllers/controllers.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  var mapMarkers = HashSet<Marker>();
  final Completer<GoogleMapController> mapCompleter = Completer();
  final mapController = Get.find<MapController>();

  void goToMyLocation() async {
    final GoogleMapController controller = await mapCompleter.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        mapController.position!.latitude,
        mapController.position!.longitude,
      ),
      zoom: 18,
    )));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        body: GetBuilder<MapController>(
          builder: (controller) => Stack(
            fit: StackFit.expand,
            children: [
              controller.position == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          controller.position!.latitude,
                          controller.position!.longitude,
                        ),
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      padding: const EdgeInsets.all(10),
                      trafficEnabled: true,
                      indoorViewEnabled: true,
                      onMapCreated: (googleMapscontroller) {
                        mapCompleter.complete(googleMapscontroller);
                        setState(() {
                          mapMarkers.add(
                            Marker(
                              markerId: const MarkerId('1'),
                              position: LatLng(
                                controller.position!.latitude,
                                controller.position!.longitude,
                              ),
                              infoWindow: const InfoWindow(
                                title: 'Cairo, Egypt',
                                snippet: 'Come to cairo !',
                              ),
                            ),
                          );
                        });
                      },
                      markers: mapMarkers,
                    ),
              FloatingSearchBar(
                hint: 'Search ...',
                borderRadius: BorderRadius.circular(20),
                scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                transitionDuration: const Duration(milliseconds: 800),
                transitionCurve: Curves.easeInOut,
                physics: const BouncingScrollPhysics(),
                openAxisAlignment: 0.0,
                width: 600,
                debounceDelay: const Duration(milliseconds: 500),
                transition: CircularFloatingSearchBarTransition(),
                onQueryChanged: (query) {},
                actions: [
                  FloatingSearchBarAction(
                    showIfOpened: false,
                    child: CircularButton(
                      icon: const Icon(Icons.place),
                      onPressed: () {},
                    ),
                  ),
                  FloatingSearchBarAction.searchToClear(
                    showIfClosed: false,
                  ),
                ],
                builder: (context, transition) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: Colors.accents.map((color) {
                          return Container(height: 112, color: color);
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 30),
          child: FloatingActionButton(
            onPressed: goToMyLocation,
            backgroundColor: Colors.blueAccent,
            child: const Icon(
              Icons.place,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
