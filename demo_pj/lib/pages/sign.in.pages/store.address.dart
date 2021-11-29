import 'package:demo_pj/controller/store.address.controller.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/checkbox.dart';
import 'package:demo_pj/resources/widgets/dropdown.list.dart';
import 'package:demo_pj/resources/widgets/image.view.dart';
import 'package:demo_pj/resources/widgets/input.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constant.dart';

class SignInStoreAddressPage extends StatelessWidget {
  final String name;
  final String phone;

  SignInStoreAddressPage({Key? key, required this.name, required this.phone})
      : super(key: key);

  final addressController = Get.put(StoreAddressController());

  var city = '', district = '', town = '', distributor = '';

  _handleCheckValue(bool value) {
    addressController.check.value = value;
  }

  _handleImagePath(String value) {
    addressController.imagePath.value = value;
  }

  _handleCityValue(int value) {
    addressController.cityId.value = value;
    for (var element in cityList) {
      if (value == element.id) {
        city = element.name;
      }
    }
  }

  _handleDistrictValue(int value) {
    addressController.districtId.value = value;
    if (addressController.cityId.value == 1) {
      for (var element in districtList1) {
        if (value == element.id) {
          district = element.name;
        }
      }
    } else {
      for (var element in districtList2) {
        if (value == element.id) {
          district = element.name;
        }
      }
    }
  }

  _handleTownValue(int value) {
    addressController.townId.value = value;
    if (addressController.cityId.value == 1) {
      if (addressController.districtId.value == 1) {
        for (var element in townList1) {
          if (value == element.id) {
            town = element.name;
          }
        }
      } else {
        for (var element in townList2) {
          if (value == element.id) {
            town = element.name;
          }
        }
      }
    } else {
      if (addressController.districtId.value == 1) {
        for (var element in townList3) {
          if (value == element.id) {
            town = element.name;
          }
        }
      } else {
        for (var element in townList4) {
          if (value == element.id) {
            town = element.name;
          }
        }
      }
    }
  }

  _handleDistributorValue(int value) {
    addressController.distributorId.value = value;
    for (var element in distributors) {
      if (value == element.id) {
        distributor = element.name;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: BackButton(
      //     color: Colors.black,
      //     onPressed: () {
      //       Get.back();
      //     },
      //   )
      // ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Text(
                'Đăng ký',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Địa chỉ',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomDropdownButton(
                          color: cINPUTFIELD_COLOR,
                          hint: 'Tỉnh / Thành phố',
                          hasIcon: false,
                          items: cityList,
                          valueReturn: _handleCityValue,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomDropdownButton(
                          color: cINPUTFIELD_COLOR,
                          hint: 'Quận / Huyện',
                          hasIcon: false,
                          valueReturn: _handleDistrictValue,
                          items: addressController
                              .districtList(addressController.cityId.value),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomDropdownButton(
                          color: cINPUTFIELD_COLOR,
                          hint: 'Phường / Xã',
                          hasIcon: false,
                          valueReturn: _handleTownValue,
                          items: addressController.townList(
                              addressController.cityId.value,
                              addressController.districtId.value),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextField(
                            hint: 'Địa chỉ cụ thể',
                            isPhone: false,
                            onChange: (String value) {
                              addressController.address.value = value;
                            },
                            color: cINPUTFIELD_COLOR),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomDropdownButton(
                          color: cINPUTFIELD_COLOR,
                          hint: 'Chọn nhà phân phối',
                          hasIcon: true,
                          valueReturn: _handleDistributorValue,
                          items: addressController.distributorList(
                              addressController.cityId.value,
                              addressController.districtId.value,
                              addressController.townId.value),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Hình ảnh cửa hàng',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ),
                        // CustomImage(
                        //   valueReturn: _handleImagePath,
                        // ),
                        CustomImage(valueReturn: _handleImagePath),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCheckbox(
                              valueReturn: _handleCheckValue,
                            ),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Tôi đồng ý với các ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey)),
                                  TextSpan(
                                      text: 'điều khoản dịch vụ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue)),
                                ]),
                              ),
                            )
                          ],
                        ),
                        CustomButton(
                            color: cPRIMARY_BUTTON_COLOR,
                            text: 'Đăng ký',
                            function: () async {
                              addressController.signInAccount(
                                  name: name,
                                  phone: phone,
                                  city: city,
                                  district: district,
                                  town: town,
                                  home: addressController.address.value,
                                  distributor: distributor,
                                  imagePath:
                                      addressController.imagePath.value.isEmpty
                                          ? null
                                          : addressController.imagePath.value);
                            }),
                      ],
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
