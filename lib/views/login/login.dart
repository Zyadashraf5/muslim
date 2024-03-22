import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hemaya/controllers/authController.dart';
import 'package:hemaya/routes/app_pages.dart';
import 'package:hemaya/views/admin/Dashbord_app.dart';
import 'package:url_launcher/url_launcher.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool secourtext = true;

  AuthControler authControler = Get.put(AuthControler());

  var ssnController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            top: 40,
            right: 0,
            left: 0,
            bottom: 40,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo1.png", height: 100),
                      Text(
                        "وزارة الشؤون الإسلامية والدعوة والإرشاد",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "TajawalMedium",
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          "حياك الله . تسجيل الدخول",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: "TajawalMedium",
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "رقم الهوية ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 320,
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: ssnController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.green.shade100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "كلمة المرور",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Icon(
                              Icons.lock,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 320,
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: secourtext,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  secourtext = !secourtext;
                                });
                              },
                              icon: Icon(
                                secourtext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.green.shade100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await authControler.loginEmailandPassword(
                              ssnController.text, passwordController.text);
                          await authControler.onInit();
                        },
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey.shade300),
                          child: const Center(
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
