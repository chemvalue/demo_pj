import 'dart:io';
import 'package:demo_pj/controller/store_address_controller.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/checkbox.dart';
import 'package:demo_pj/resources/widgets/dropdown_list.dart';
import 'package:demo_pj/resources/widgets/input_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../../constant.dart';

class SignInStoreAddressPage extends StatefulWidget {
  const SignInStoreAddressPage(
      {Key? key, required this.name, required this.phone})
      : super(key: key);

  final String name;
  final String phone;

  @override
  _SignInStoreAddressPageState createState() => _SignInStoreAddressPageState();
}

class _SignInStoreAddressPageState extends State<SignInStoreAddressPage> {
  final addressController = Get.put(StoreAddressController());
  var city, district, town, distributor;
  File? imageFile;


  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      // chua cap nhat duoc thong qua getx
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      // chua cap nhat duoc thong qua getx
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  dynamic _handleCheckValue(bool value) {
    addressController.check.value = value;
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
                        inputWidget(
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
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: imageFile == null
                              ? DottedBorder(
                                  borderType: BorderType.Rect,
                                  dashPattern: const [3, 3],
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.defaultDialog(
                                          contentPadding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 20,
                                              left: 20,
                                              right: 20),
                                          titlePadding:
                                              const EdgeInsets.only(top: 20),
                                          title: 'Ảnh',
                                          titleStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                          content: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                  _getFromCamera();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 200.w,
                                                  height: 40.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: getColorFromHex(
                                                        cPRIMARY_BUTTON_COLOR),
                                                  ),
                                                  child: const Text(
                                                    'Chụp ảnh mới',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                  _getFromGallery();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 200.w,
                                                  height: 40.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: getColorFromHex(
                                                        cPRIMARY_BUTTON_COLOR),
                                                  ),
                                                  child: const Text(
                                                    'Mở thư viện ảnh',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ));
                                    },
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.photo,
                                            size: 80,
                                          ),
                                          Text('Thêm ảnh')
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.defaultDialog(
                                        contentPadding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 20,
                                            left: 20,
                                            right: 20),
                                        titlePadding:
                                            const EdgeInsets.only(top: 20),
                                        title: 'Ảnh',
                                        titleStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                        content: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.back();
                                                _getFromCamera();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 200.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: getColorFromHex(
                                                      cPRIMARY_BUTTON_COLOR),
                                                ),
                                                child: const Text(
                                                  'Chụp ảnh mới',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.back();
                                                _getFromGallery();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 200.w,
                                                height: 40.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: getColorFromHex(
                                                      cPRIMARY_BUTTON_COLOR),
                                                ),
                                                child: const Text(
                                                  'Mở thư viện ảnh',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                  child: SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            CustomCheckbox(
                              valueReturn: _handleCheckValue,
                            ),
                            Text('Tôi đồng ý với các điều khoản dịch vụ'),
                          ],
                        ),
                        customButton(
                            color: cPRIMARY_BUTTON_COLOR,
                            text: 'Đăng ký',
                            function: () async {
                              addressController.signInAccount(
                                  name: widget.name,
                                  phone: widget.phone,
                                  city: city,
                                  district: district,
                                  town: town,
                                  home: addressController.address.value,
                                  distributor: distributor,
                                  imagePath: imageFile?.path);
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
