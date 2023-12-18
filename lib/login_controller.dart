import 'package:get/get.dart';

class LoginController extends GetxController {
  final name = ''.obs;
  final password = ''.obs;
  void SetName(String value) => name.value = value;
  SetPassword(String value) => password.value = value;
  bool check(String nameCheck, String passCheck) {
    SetName('linh');
    SetPassword('linhdeptrai');
    return name.value == nameCheck && password.value == passCheck;
  }
}
