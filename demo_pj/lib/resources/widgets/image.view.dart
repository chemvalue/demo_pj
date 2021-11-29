import 'dart:io';
import 'package:demo_pj/controller/image.controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant.dart';
import '../utilities.dart';

class CustomImage extends StatelessWidget {

  final imageController = Get.put(ImageController());

  final Function(String) valueReturn;

  CustomImage({Key? key, required this.valueReturn}) : super(key: key);

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageController.setPath(pickedFile.path);
      valueReturn(pickedFile.path);
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print('ok');
      imageController.setPath(pickedFile.path);
      print(imageController.path.value);
      valueReturn(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: imageController.path.value.isEmpty
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
                    const SizedBox(
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
                  const SizedBox(
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
            File(imageController.path.value),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
