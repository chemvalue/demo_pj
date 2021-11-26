import 'package:demo_pj/pages/sign_in_pages/store_address.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:get/get.dart';

class StoreIdentifyController extends GetxController{

  void confirmInfo({required String name, required String phone}){
    if (name.trim().isNotEmpty && phoneCheck(phone)) {
      Get.to(() => SignInStoreAddressPage(name: name, phone: phone,));
    }
  }
}