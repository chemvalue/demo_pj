import 'package:demo_pj/constant.dart';
import 'package:demo_pj/controller/dropdown.controller.dart';
import 'package:demo_pj/models/temp.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utilities.dart';

class CustomDropdownButton extends StatelessWidget {
  final String color;
  final String hint;
  final bool hasIcon;
  final List<TempModel>? items;
  final Function(int) valueReturn;

  final dropdownController = Get.put(DropdownController());

  CustomDropdownButton(
      {Key? key,
      required this.color,
      required this.hint,
      required this.hasIcon,
      this.items,
      required this.valueReturn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: getColorFromHex(color).withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: dropdownController.check.value ? dropdownController.selected.value : null,
          onChanged: (int? newValue) {
            dropdownController.setSelected(newValue!);
            dropdownController.check.value = true;
            valueReturn(newValue);
          },
          items: items == null
              ? null
              : items!.map((TempModel item) {
            return DropdownMenuItem<int>(
              value: item.id,
              child: Text(item.name),
            );
          }).toList(),
          hint: hasIcon
              ? Row(
            children: [
              Icon(
                Icons.store,
                color: getColorFromHex(cPRIMARY_BUTTON_COLOR),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(hint),
            ],
          )
              : Text(hint),
        ),
      )),
    );
  }
}
