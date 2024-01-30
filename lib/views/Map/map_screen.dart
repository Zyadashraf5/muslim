import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/masgedController.dart';
import 'package:muslimapp/models/Masagedy.dart';
import 'package:muslimapp/views/Inspection%20tours/Infringements.dart';
import 'package:muslimapp/views/pdfs/pdf_inspection.dart';
import 'package:muslimapp/views/select_masagedy/select_masagedy.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<MasagedyModel> masaged = [];
  List<MasagedyModel> filteredMasaged = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMasaged = masaged;
  }

  @override
  void didChangeDependencies() async {
    MasgedController masgedController = Get.put(MasgedController());

    masaged = masgedController.allMasagedOnMap;
    filteredMasaged = masgedController.allMasagedOnMap;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasgedController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'ابحث عن مسجد',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.black),
            onChanged: (query) {
              setState(() {
                filteredMasaged = masaged
                    .where((masged) => masged.namemasaged!
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
              });
            },
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(24.728753, 46.724194),
            zoom: 10.0,
          ),
          markers: masaged
              .map((masged) => Marker(
                    markerId: MarkerId(masged.namemasaged!),
                    position: LatLng(
                        double.parse(
                            masged.location.split("(")[1].split(",")[0]),
                        double.parse(masged.location
                            .split("(")[1]
                            .split(",")[1]
                            .replaceAll(")", ""))),
                    onTap: () {
                      Get.to(PdfInspection(
                        masgedModel: masged,
                      ));
                    },
                  ))
              .toSet(),
        ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: filteredMasaged.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredMasaged[index].namemasaged!),
                onTap: () {
                  Get.to(PdfInspection(
                    masgedModel: filteredMasaged[index],
                  ));
                },
              );
            },
          ),
        ),
      );
    });
  }
}
