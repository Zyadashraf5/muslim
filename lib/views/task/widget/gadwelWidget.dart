import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/GadwelController.dart';
import 'package:hemaya/models/Gadwel.dart';
import 'package:hemaya/models/Masagedy.dart';
import 'package:hemaya/views/pdfs/pdf.dart';
import 'package:hemaya/views/pdfs/pdf_inspection.dart';

import '../../select_masagedy/select_masagedy.dart';

class GadwelWidget extends StatelessWidget {
  GadwelWidget({required this.gadwelModel, super.key});
  GadwelModel gadwelModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GadwelController gadwelController = Get.put(GadwelController());
        gadwelController.currentGadwel = gadwelModel;
        gadwelController.update();
        Get.to(Pdf());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade800, width: 6),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code_2_outlined,
                color: Colors.green.shade300,
                size: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "زمن الجدول : ${gadwelModel.year}/${gadwelModel.month}",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "TajawalMedium",
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
