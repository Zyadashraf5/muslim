import 'package:get/get.dart';
import 'package:hemaya/controllers/settingController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class taskescontroller extends GetxController {
  String? ssn;
  bool isLoading = false;

  getssn() async {
    isLoading = true;
    update();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ssn = preferences.getString('ssn');
    isLoading = false;
    update();
  }

  @override
  Future<void> onInit() async {
    await getssn();
    update();

    super.onInit();
  }
}
