import 'package:demo_pj/controller/checkbox.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../utilities.dart';

class CustomCheckbox extends StatelessWidget {

  final Function(bool) valueReturn;

  final _controller = Get.put(CheckboxController());

  CustomCheckbox({Key? key, required this.valueReturn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Checkbox(
        fillColor: MaterialStateProperty.all(Colors.white),
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            width: 2.0,
            color: getColorFromHex(cPRIMARY_BUTTON_COLOR),
          ),
        ),
        checkColor: getColorFromHex(cPRIMARY_BUTTON_COLOR),
        value: _controller.value.value,
        onChanged: (bool? newValue) {
          _controller.value.value = newValue!;
          valueReturn(newValue);
        }));
  }
}
