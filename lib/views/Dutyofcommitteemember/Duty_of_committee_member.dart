import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemaya/controllers/authController.dart';

class DutyMember extends GetView<AuthControler> {
  const DutyMember({super.key});

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
              top: 40,
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo1.png",
                      height: 100,
                    ),
                    Text(
                      "وزارة الشؤون الإسلامية والدعوة والإرشاد",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "TajawalMedium",
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            //top 180 left 150

            //top 240 left 60
            Positioned(
              top: 220,
              left: 10,
              right: 10,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    int.parse(controller.user!.role) == 1
                        ? dutybottons(
                            "استلام جدول الجولات التفقديه",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1
                        ? dutybottons(
                            "مباشرة عمليات الرصد",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1
                        ? dutybottons(
                            "اخذ افادة المنسوب",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1
                        ? dutybottons(
                            " التوثيق (صور + فديو) ",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1
                        ? dutybottons(
                            "كتابة التقرير",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 1
                        ? dutybottons(
                            "الرفع للمشرف",
                          )
                        : SizedBox(),
                    ///////////////////////////////////////
                    ///مشرف اللجان
                    int.parse(controller.user!.role) == 3
                        ? dutybottons(
                            "وضع خطة عمل لرصد التعديات", //
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 3
                        ? dutybottons(
                            "الإشراف على الخطة والتنفيذ مع الاعضاء ", //
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 3
                        ? dutybottons(
                            "متابعة سير العمل ", //
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 3
                        ? dutybottons(
                            "استلام التقارير من الاعضاء ", //
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 3
                        ? dutybottons(
                            "التدقيق والمتابعة ",
                          )
                        : SizedBox(),
                    int.parse(controller.user!.role) == 3
                        ? dutybottons(
                            "رفع التقارير لمدير الادارة",
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

Widget dutybottons(
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
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
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
