
import 'package:demo_pj/pages/sign.in.pages/store.address.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:get/get.dart';

class StoreIdentifyController extends GetxController{

  void confirmInfo({required String name, required String phone}){
    if (name.trim().isNotEmpty && phoneCheck(phone)) {
      Get.to(() => SignInStoreAddressPage(name: name, phone: phone,));
      return;
    } else{

    }
    if(name.trim().isEmpty){
      Get.snackbar('Lỗi', 'Mời nhập tên cửa hàng');
      return;
    }
    if(!phoneCheck(phone)){
      Get.snackbar('Lỗi', 'Mời nhập lại số điện thoại');
      return;
    }
  }
}