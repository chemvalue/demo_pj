import 'package:demo_pj/resources/utilities.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hint,
      required this.isPhone,
      required this.color,
      required this.onChange, this.icon})
      : super(key: key);

  final String hint;
  final bool isPhone;
  final String color;
  final Function(String) onChange;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        onChanged: onChange,
        keyboardType: isPhone ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          fillColor: getColorFromHex(color).withOpacity(0.5),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          prefixIcon: icon,
          hintText: hint,
        ),
      ),
    );
  }
}
