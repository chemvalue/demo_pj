import 'dart:io';

import 'package:demo_pj/constant.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/input.field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();
  String name = '';
  String phone = '';
  String email = '';
  String id = '';

  var imageFile;

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
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
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    idController.dispose();
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
                '????ng k??',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Th??ng tin ?????nh danh',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                        hint: 'Nh???p t??n',
                        isPhone: false,
                        onChange: (String value) {},
                        color: cINPUTFIELD_COLOR),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hint: 'Nh???p s??? ??i???n tho???i',
                        isPhone: true,
                        onChange: (String value) {},
                        color: cINPUTFIELD_COLOR),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hint: 'Nh???p email',
                        isPhone: false,
                        onChange: (String value) {},
                        color: cINPUTFIELD_COLOR),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hint: 'Nh???p s??? CCCD/CMND',
                        isPhone: false,
                        onChange: (String value) {},
                        color: cINPUTFIELD_COLOR),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      '???nh x??c nh???n CCCD/CMND',
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
                                      title: '???nh',
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
                                                'Ch???p ???nh m???i',
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
                                                'M??? th?? vi???n ???nh',
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.photo,
                                        size: 80,
                                      ),
                                      Text('Th??m ???nh')
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
                                    title: '???nh',
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
                                              'Ch???p ???nh m???i',
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
                                              'M??? th?? vi???n ???nh',
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
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        color: cPRIMARY_BUTTON_COLOR,
                        text: 'Ti???p t???c',
                        function: () async {
                          Get.defaultDialog(
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 20, left: 20, right: 20),
                            titlePadding: const EdgeInsets.only(top: 20),
                            title: '????ng k?? th??nh c??ng',
                            titleStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            content: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Ch??c m???ng b???n ???? ????ng k?? th??nh c??ng. \nVui l??ng quay l???i m??n h??nh ????ng nh???p',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            confirm: GestureDetector(
                              onTap: () {
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
                                  'Tr??? l???i ????ng nh???p',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                          // if (nameController.text.isNotEmpty &&
                          //     phoneCheck(phoneController.text) &&
                          //     emailCheck(emailController.text)) {
                          //   await updateUserList(UserModel(
                          //       name: nameController.text,
                          //       phone: phoneController.text,
                          //       email: emailController.text));
                          //   // readJson();
                          //
                          //   Get.defaultDialog(
                          //     title: '????ng k?? th??nh c??ng',
                          //     titleStyle: const TextStyle(
                          //         fontSize: 15, fontWeight: FontWeight.w500),
                          //     middleText:
                          //         'Ch??c m???ng b???n ???? ????ng k?? th??nh c??ng. \nVui l??ng quay l???i m??n h??nh ????ng nh???p',
                          //     confirm: GestureDetector(
                          //       onTap: () {
                          //         Get.back();
                          //         Get.back();
                          //       },
                          //       child: Container(
                          //         alignment: Alignment.center,
                          //         width: 150.w,
                          //         height: 40.h,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(20),
                          //           color: Colors.red,
                          //         ),
                          //         child: Text('Tr??? l???i ????ng nh???p'),
                          //       ),
                          //     ),
                          //   );
                          // }
                        }),
                  ],
                ),
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
