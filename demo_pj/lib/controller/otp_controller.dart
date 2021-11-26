
import 'package:get/get.dart';

class OtpController extends GetxController{
  var check = true.obs;
  void correct() {
    check.value = true;
    update();
  }
  void wrong(){
    check.value = false;
    update();
  }
}