import 'package:demo_pj/constant.dart';
import 'package:demo_pj/controller/login.controller.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/input.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final login = Get.put(LoginController());
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: availableHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Sử dụng số điện thoại',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    CustomTextField(
                        hint: 'Nhập số điện thoại',
                        isPhone: true,
                        color: cINPUTFIELD_COLOR,
                        icon: Icon(
                          Icons.call,
                          size: 20,
                          color: getColorFromHex(cPRIMARY_BUTTON_COLOR),
                        ),
                        onChange: (String value) {
                          phoneNumber = value;
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      color: cPRIMARY_BUTTON_COLOR,
                      text: 'Đăng nhập',
                      function: () => login.loginTap(phoneNumber),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      login.goToSignIn();
                    },
                    child: const Text(
                      'Đăng ký ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text('nếu bạn chưa có tài khoản'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
