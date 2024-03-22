import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hemaya/controllers/masgedController.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  GoogleMapController? _mapController;
  MasgedController masgedController = Get.put(MasgedController());
  Marker? _marker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('موقع المسجد'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true, // Enable user's current location
            mapToolbarEnabled: true,
            
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: Set<Marker>.from([
              if (masgedController.location != LatLng(0, 0))
                Marker(
                  markerId: MarkerId(masgedController.location.toString()),
                  position: masgedController.location,
                )
              else if (_marker != null)
                _marker!,
            ]),
            initialCameraPosition: CameraPosition(
              target: LatLng(24.7136, 46.6753), // Initial map center
              zoom: 12.0, // Initial zoom level
            ),
            onTap: (LatLng position) {
              setState(() {
                if (_marker == null) {
                  _marker = Marker(
                    markerId: MarkerId(position.toString()),
                    position: position,
                  );
                  masgedController.location = position;
                  masgedController.update();
                }
              });
            },
          ),
          masgedController.location != LatLng(0, 0)
              ? Positioned(
                  bottom: 25,
                  left: 16,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
