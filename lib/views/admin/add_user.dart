import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hemaya/controllers/authController.dart';

class AddUser extends GetView<AuthControler> {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthControler());
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              Image.asset(
                "assets/logo1.png",
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "وزارة الشؤون الإسلامية والدعوة والإرشاد",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "TajawalMedium",
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GetBuilder<AuthControler>(builder: (controller) {
                    return DropdownButton(
                      underline: SizedBox(),
                      hint: Text(
                        "صلاحيات",
                      ),
                      alignment: Alignment.centerRight,
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      value: controller.roleEditingController.text != ""
                          ? controller.roleEditingController.text
                          : null,
                      items: controller.listitem.map((valueitem) {
                        return DropdownMenuItem<String>(
                          value: valueitem,
                          alignment: Alignment.centerRight,
                          child: Text(
                            valueitem,
                            textAlign: TextAlign.right,
                          ),
                        );
                      }).toList(),
                      onChanged: (newvalue) {
                        int index = controller.listitem.indexOf(newvalue);
                        controller.roleIdController.text =
                            (index + 1).toString();
                        controller.roleEditingController.text = newvalue!;
                        controller.update();
                      },
                    );
                  }),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: controller.firstName,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 237, 232),
                    hintText: " الاسم الاول ",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: controller.lastName,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 237, 232),
                    hintText: "الاسم الاخير",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: controller.ssnController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 237, 232),
                    hintText: "رقم الهويه",
                    suffixIcon: const Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 237, 232),
                    hintText: "رقم هاتف",
                    suffixIcon: const Icon(
                      Icons.mobile_friendly,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  obscureText: controller.secourpasss,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFe7edeb),
                    hintText: "كلمة المرور",
                    suffixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: TextFormField(
                  obscureText: controller.secourpasss,
                  controller: controller.confrimpasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFe7edeb),
                    hintText: "تأكيد كلمة المرور ",
                    suffixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  var name =
                      '${controller.firstName.text} ${controller.lastName.text}';
                  if (controller.confrimpasswordController.text !=
                      controller.passwordController.text) {
                    return;
                  }
                  await controller.addUser(
                      controller.ssnController.text,
                      controller.roleIdController.text,
                      controller.passwordController.text,
                      controller.phoneController.text,
                      name,
                      controller.roleEditingController.text,
                      context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("تم اضافة المستخدم"),
                  ));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green.shade300),
                  child: const Center(
                    child: Text(
                      "اضافة مستخدم ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}
