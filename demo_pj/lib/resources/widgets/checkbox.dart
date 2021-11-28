import 'package:demo_pj/controller/checkbox.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key, required this.valueReturn}) : super(key: key);
  final Function(bool) valueReturn;
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  final _controller = Get.put(CheckboxController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Checkbox(
        fillColor: MaterialStateProperty.all(Colors.white),
        side: MaterialStateBorderSide.resolveWith(
              (states) =>
          const BorderSide(width: 2.0, color: Colors.red),
        ),
        checkColor: Colors.red,
        value: _controller.value.value,
        onChanged: (bool? newValue) {
          _controller.value.value = newValue!;
          widget.valueReturn(newValue);
        }));
  }
}
