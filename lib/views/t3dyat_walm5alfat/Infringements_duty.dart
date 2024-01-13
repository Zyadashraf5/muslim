import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/authController.dart';

class Infringements_duty extends GetView<AuthControler> {
  const Infringements_duty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthControler>(
      builder: (controller) {
        return Stack(
          children: [
            Positioned(
              child: Image.asset(
                "assets/backgroud1.png",
              ),
              width: MediaQuery.of(context).size.width,
              right: 0,
            ),
            Positioned(
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo1.png",
                        height: 100,
                      ),
                      Text(
                        "وزارة الشؤون الاسلاميه و الدعوة و الارشاد ",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "TajawalMedium",
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 50,
              left: 50,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.green.shade300, width: 4),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "التعديات",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "TajawalMedium",
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //top 180 left 150

            //top 240 left 60
            Positioned(
              top: 280,
              left: 10,
              right: 10,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    int.parse(controller.user!.role) == 1 ||
                            int.parse(controller.user!.role) == 2 ||
                            int.parse(controller.user!.role) == 3
                        ? Infringementsdutybottons(
                            "تعدي على الكهرباء",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1 ||
                            int.parse(controller.user!.role) == 2 ||
                            int.parse(controller.user!.role) == 3
                        ? Infringementsdutybottons(
                            "تعدي على المياه ",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1 ||
                            int.parse(controller.user!.role) == 2 ||
                            int.parse(controller.user!.role) == 3
                        ? Infringementsdutybottons(
                            "تعدي على المرافق ",
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}

Widget Infringementsdutybottons(
  String text,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: InkWell(
      onTap: () {},
      child: Container(
        width: 330,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 7,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.green.shade700, width: 4.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "TajawalMedium",
                  color: Colors.black),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    ),
  );
}
