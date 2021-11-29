import 'package:demo_pj/controller/otp.controller.dart';
import 'package:demo_pj/pages/home.page.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/otp.input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:demo_pj/constant.dart';

class OtpPage extends StatelessWidget {
  var otp = '';
  final String phoneNumber;
  final otpController = Get.put(OtpController());

  OtpPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          )),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Xác nhận OTP',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Mã OTP đã được gửi tới số điện thoại $phoneNumber\nVui lòng nhập mã xác nhận dưới đây.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
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
                    children: [
                      OtpInput(
                          onChange: (String value) {
                            otp = value;
                            if (6 == value.length) {
                              otpController.correct();
                            }
                          },
                          isTrue: otpController.check.value),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 25.h,
                        width: double.infinity,
                        child: otpController.check.value
                            ? null
                            : const Text(
                                'Nhập sai dữ liệu, vui lòng nhập lại',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.red),
                              ),
                      ),
                      CustomButton(
                        check: otpController.check.value,
                        color: cPRIMARY_BUTTON_COLOR,
                        text: 'Xác nhận',
                        function: () {
                          if (cOTP == otp) {
                            otpController.correct();
                            Get.back();
                            Get.to(() => const HomePage());
                          } else {
                            otpController.wrong();
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 20, left: 20, right: 20),
                            titlePadding: const EdgeInsets.only(top: 20),
                            title: 'Thao tác thành công',
                            titleStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            content: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                'Mã OTP mới của bạn là \n$cOTP',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            confirm: GestureDetector(
                              onTap: () {
                                otpController.correct();
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
                                  'Trở lại',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            // barrierDismissible: false,
                            onWillPop: () async {
                              otpController.correct();
                              return true;
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: 1, // Space between underline and text
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.grey,
                            width: 1.sp, // Underline thickness
                          ))),
                          child: const Text(
                            'Gửi lại OTP',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
