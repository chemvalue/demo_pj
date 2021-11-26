
import 'package:demo_pj/controller/user_controller.dart';
import 'package:demo_pj/pages/otp_page.dart';
import 'package:demo_pj/pages/sign_in_pages/store_identify.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:get/get.dart';

import '../constant.dart';

class LoginController extends GetxController{

  void goToSignIn(){
    Get.to(() => StoreIdentifyPage());
  }

  Future<void> loginTap(String phoneNumber) async {
    if (RegExp(cPHONE_VALIDATE).hasMatch(phoneNumber)) {
      var user = await storeRegistered(phoneNumber);
      if(user != null){
        Get.put(UserController()).initUser(user);
        Get.to(()=>OtpPage());
      } else{
        Get.snackbar('Lỗi đăng nhập', 'Số điện thoại này chưa được đăng ký!');
      }
    } else {
      Get.snackbar('Lỗi', 'Mời nhập lại sđt!');
    }
  }
}