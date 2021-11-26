import 'package:demo_pj/controller/otp_controller.dart';
import 'package:demo_pj/pages/home_page.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:demo_pj/constant.dart';

class OtpPage extends StatelessWidget {
  String otp = '';
  final checker = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Xác nhận OTP',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
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
                          },
                          isTrue: checker.check.value),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 25.h,
                        width: double.infinity,
                        child: checker.check.value
                            ? null
                            : const Text(
                                'Nhập sai dữ liệu, vui lòng nhập lại',
                                style: TextStyle(fontSize: 10, color: Colors.red),
                              ),
                      ),
                      customButton(
                        check: checker.check.value,
                        color: cPRIMARY_BUTTON_COLOR,
                        text: 'Xác nhận',
                        function: () {
                          if (cOTP == otp) {
                            checker.correct();
                            Get.back();
                            Get.to(HomePage());
                          } else {
                            checker.wrong();
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: 1, // Space between underline and text
                          ),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.sp, // Underline thickness
                              ))
                          ),
                          child: const Text(
                            'Gửi lại OTP', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
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
