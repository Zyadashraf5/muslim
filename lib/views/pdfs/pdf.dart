import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/GadwelController.dart';

class Pdf extends GetView<GadwelController> {
  Pdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<GadwelController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "${controller.currentGadwel!.date!.split(" ")[0]}"),
                              Text(":"),
                              Text("التاريخ"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/1.png",
                    width: 90,
                  ),
                  Image.asset(
                    "assets/2.png",
                    width: 90,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "(أعضاء اللجان الميدانية بإدارة حماية مرافق المساجد و خدماتها)",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" ${controller.currentGadwel!.year} ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("لعام"),
                  Text(
                    " ${controller.currentGadwel!.month} ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text("جدول العمل لشهر"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "العضو :  ${controller.currentGadwel!.al3dw}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  CustomDivider(
                    height: 25,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableHead(
                      text: "المراقب - الجوال",
                    ),
                  ),
                  CustomDivider(
                    height: 25,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableHead(
                      text: "عدد المساجد",
                    ),
                  ),
                  CustomDivider(
                    height: 25,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableHead(
                      text: "المركز - الحي",
                    ),
                  ),
                  CustomDivider(
                    height: 25,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableHead(
                      text: "التاريخ",
                    ),
                  ),
                  CustomDivider(
                    height: 25,
                  ),
                  Expanded(
                      child: TableHead(
                    text: "الأسبوع",
                  )),
                  CustomDivider(
                    height: 25,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.asmalmra8bFrist} ${controller.currentGadwel!.numbermra8bFrist}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text: "${controller.currentGadwel!.numberofmasagedFrist}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.centerFrist} - ${controller.currentGadwel!.al7yFrist}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          " ${controller.currentGadwel!.month}/${controller.currentGadwel!.dateFrist}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                      child: TableCell(
                    text: "الأول",
                  )),
                  CustomDivider(
                    height: 40,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "  ${controller.currentGadwel!.asmalmra8bSecond} ${controller.currentGadwel!.numbermra8bSecond}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.numberofmasagedSecond}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.centerSecond} - ${controller.currentGadwel!.al7ySecond}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          " ${controller.currentGadwel!.month}/${controller.currentGadwel!.dateSecond}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                      child: TableCell(
                    text: "الثاني",
                  )),
                  CustomDivider(
                    height: 40,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.asmalmra8bThird} ${controller.currentGadwel!.numbermra8bThird}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text: "${controller.currentGadwel!.numberofmasagedThird}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.centerThird} - ${controller.currentGadwel!.al7yThird}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.month}/${controller.currentGadwel!.dateThird}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                      child: TableCell(
                    text: "الثالث",
                  )),
                  CustomDivider(
                    height: 40,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.asmalmra8bFourth} ${controller.currentGadwel!.numbermra8bFourth}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.numberofmasagedFourth}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.centerFourth} - ${controller.currentGadwel!.al7yFourth}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: TableCell(
                      text:
                          "${controller.currentGadwel!.month}/${controller.currentGadwel!.dateFourth}",
                    ),
                  ),
                  CustomDivider(
                    height: 40,
                  ),
                  Expanded(
                      child: TableCell(
                    text: "الرابع",
                  )),
                  CustomDivider(
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "مشرف اللجان الميدانية",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      controller.currentGadwel!.signatureRole3 != null
                          ? Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                children: [
                                  Text(controller
                                      .currentGadwel!.signerNameRole3!),
                                  Image.network(
                                    controller.currentGadwel!.signatureRole3!,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            )
                          : Container()
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    ));
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 1,
      height: height,
    );
  }
}

class TableHead extends StatelessWidget {
  const TableHead({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Container(
          height: 25,
          alignment: Alignment.center,
          color: const Color(0xffdfdfdf),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ));
  }
}

class TableCell extends StatelessWidget {
  const TableCell({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: const EdgeInsets.only(bottom: 1),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
