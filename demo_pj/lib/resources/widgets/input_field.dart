import 'package:demo_pj/resources/utilities.dart';
import 'package:flutter/material.dart';

Widget inputWidget(
    {required String hint,
    required bool isPhone,
    required String color,
    required Function(String) onChange,
    Icon? icon}) {
  return SizedBox(
    height: 45,
    child: TextField(
      onChanged: onChange,
      keyboardType: isPhone ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        fillColor: getColorFromHex(color).withOpacity(0.5),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        prefixIcon: icon,
        hintText: hint,
      ),
    ),
  );
}
