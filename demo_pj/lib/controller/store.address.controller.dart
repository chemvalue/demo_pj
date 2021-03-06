import 'package:demo_pj/constant.dart';
import 'package:demo_pj/models/temp.model.dart';
import 'package:demo_pj/models/store.model.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StoreAddressController extends GetxController {
  var cityId = 0.obs;
  var districtId = 0.obs;
  var townId = 0.obs;
  var distributorId = 0.obs;
  var check = false.obs;
  var imagePath = ''.obs;
  var address = ''.obs;

  void signInAccount({
    required String name,
    required String phone,
    required String city,
    required String district,
    required String town,
    required String home,
    required String distributor,
    required dynamic imagePath,
  }) async {

    if (0 != cityId.value &&
        0 != districtId.value &&
        0 != townId.value &&
        0 != distributorId.value &&
        '' != address.value.trim() &&
        check.value) {
      var store = StoreModel(
        name: name,
        phone: phone,
        townAddress: town,
        cityAddress: city,
        homeAddress: home,
        districtAddress: district,
        distributor: distributor,
        imagePath: imagePath,
      );
      await registerNewAccount(store);
      Get.defaultDialog(
        contentPadding:
            const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
        titlePadding: const EdgeInsets.only(top: 20),
        title: 'Đăng ký thành công',
        titleStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        content: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(
            'Chúc mừng bạn đã đăng ký thành công. \nVui lòng quay lại màn hình đăng nhập',
            textAlign: TextAlign.center,
          ),
        ),
        confirm: GestureDetector(
          onTap: () {
            Get.back();
            Get.back();
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            width: 150.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: getColorFromHex(cPRIMARY_BUTTON_COLOR),
            ),
            child: const Text(
              'Trở lại đăng nhập',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    } else {
      if(0 == cityId.value) {
        showSnackbar(message: 'Mời chọn tỉnh / thành phố!');
        return;
      }
      if(0 == districtId.value) {
        showSnackbar(message: 'Mời chọn quận / huyện!');
        return;
      }
      if(0 == townId.value) {
        showSnackbar(message: 'Mời chọn phường / xã!');
        return;
      }
      if('' == address.value.trim()) {
        showSnackbar(message: 'Mời nhập địa chỉ cụ thể!');
        return;
      }
      if(0 == distributorId.value) {
        showSnackbar(message: 'Mời chọn nhà phân phối!');
        return;
      }
      if(!check.value) {
        showSnackbar(message: 'Chưa đồng ý điều khoản dịch vụ');
        return;
      }
    }
  }

  void showSnackbar({required String message}){
    Get.snackbar('Lỗi', message);
  }

  List<TempModel>? districtList(int cityId) {
    if (1 == cityId) {
      return districtList1;
    }
    if (2 == cityId) {
      return districtList2;
    }
    return null;
  }

  List<TempModel>? townList(int cityId, int districtId) {
    if (1 == districtId) {
      if (1 == cityId) {
        return townList1;
      }
      if (2 == cityId) {
        return townList3;
      }
    }
    if (2 == districtId) {
      if (1 == cityId) {
        return townList2;
      }
      if (2 == cityId) {
        return townList4;
      }
    }
    return null;
  }

  List<TempModel> distributorList(int cityId, int districtId, int townId) {
    // if (0 != cityId && 0 != districtId && 0 != townId) {
    //   return distributors;
    // }
    return distributors;
  }
}
