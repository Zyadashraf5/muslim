import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hemaya/controllers/masgedController.dart';

import '../../controllers/Asnhlak3alyController.dart';

class LocationPageAsnhlak3aly extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPageAsnhlak3aly> {
  GoogleMapController? _mapController;
  Asnhlak3alyController asnhlak3alyController =
      Get.put(Asnhlak3alyController());
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
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: Set<Marker>.from([
              if (asnhlak3alyController.location != LatLng(0, 0))
                Marker(
                  markerId: MarkerId(asnhlak3alyController.location.toString()),
                  position: asnhlak3alyController.location,
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
                  asnhlak3alyController.location = position;
                  asnhlak3alyController.update();
                }
              });
            },
          ),
          asnhlak3alyController.location != LatLng(0, 0)
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
              : Container()
        ],
      ),
    );
  }
}
