import 'package:demo_pj/controller/store.identify.controller.dart';
import 'package:demo_pj/resources/utilities.dart';
import 'package:demo_pj/resources/widgets/button.dart';
import 'package:demo_pj/resources/widgets/input.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class StoreIdentifyPage extends StatelessWidget {

  StoreIdentifyPage({Key? key}) : super(key: key);

  String nameStore = '';
  String phoneNumber = '';

  final storeIdentify = Get.put(StoreIdentifyController());

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                        hint: 'Nhập tên cửa hàng',
                        isPhone: false,
                        onChange: (String value) {
                          nameStore = value;
                        },
                        icon: Icon(
                          Icons.store,
                          size: 20,
                          color: getColorFromHex(cPRIMARY_BUTTON_COLOR),
                        ),
                        color: cINPUTFIELD_COLOR),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hint: 'Nhập số điện thoại',
                        isPhone: true,
                        onChange: (String value) {
                          phoneNumber = value;
                        },
                        icon: Icon(
                          Icons.call,
                          size: 20,
                          color: getColorFromHex(cPRIMARY_BUTTON_COLOR),
                        ),
                        color: cINPUTFIELD_COLOR),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(
                        color: cPRIMARY_BUTTON_COLOR,
                        text: 'Tiếp tục',
                        function: () => storeIdentify.confirmInfo(
                            name: nameStore, phone: phoneNumber)),
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
                      Get.back();
                    },
                    child: const Text(
                      'Đăng nhập ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text('nếu bạn đã có tài khoản'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
