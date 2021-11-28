
import 'package:demo_pj/controller/user.controller.dart';
import 'package:demo_pj/pages/otp.page.dart';
import 'package:demo_pj/pages/sign.in.pages/store.identify.dart';
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
        Get.to(()=>OtpPage(phoneNumber: phoneNumber,));
      } else{
        Get.snackbar('Lỗi đăng nhập', 'Số điện thoại này chưa được đăng ký!');
      }
    } else {
      Get.snackbar('Lỗi', 'Mời nhập lại sđt!');
    }
  }
}