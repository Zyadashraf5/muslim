import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslimapp/controllers/homeController.dart';

class MyAnalytics extends StatelessWidget {
  const MyAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      Get.put(HomeController());
      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: Image.asset(
                "assets/backgroud1.png",
              ),
              width: MediaQuery.of(context).size.width,
              right: 0,
            ),
            Positioned(
              top: 80,
              right: 0,
              left: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/logo1.png",
                        height: 100,
                      ),
                      Text(
                        "وزارة الشؤون الاسلاميه و الدعوة و الارشاد ",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${controller.myMasagedss.length} : عدد الجولات التفقديه ",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${controller.myGadwalss.length} : عدد الجداول ",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Chart for Masgeds:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            barGroups:
                                controller.masgedsssDataChart.keys.map((e) {
                              return BarChartGroupData(
                                x: e.month,
                                
                                barRods: [
                                  BarChartRodData(
                                    toY: controller.masgedsssDataChart[e]!
                                        .toDouble(),
                                  ),
                                ],
                              );
                            }).toList(),
                            maxY: 10,
                            minY: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Chart for Gadwels:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            height: 200,
                            child: BarChart(
                              BarChartData(
                                barGroups:
                                    controller.gadwelsssDataChart.keys.map((e) {
                                  return BarChartGroupData(
                                    showingTooltipIndicators: [1],
                                    x: e.month,
                                    barRods: [
                                      BarChartRodData(
                                        toY: controller.gadwelsssDataChart[e]!
                                            .toDouble(),
                                      ),
                                    ],
                                  );
                                }).toList(),
                                maxY: 10,
                                minY: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
