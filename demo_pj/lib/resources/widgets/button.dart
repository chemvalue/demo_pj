import 'package:flutter/material.dart';
import '../../constant.dart';
import '../utilities.dart';

Widget customButton(
    {required String color,
    required String text,
    Function()? function,
    bool check = true}) {
  return GestureDetector(
    onTap: check ? function : null,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color:
            check ? getColorFromHex(color) : getColorFromHex(cINPUTFIELD_COLOR),
      ),
      child: Text(
        text,
        style: check
            ? const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)
            : TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                fontSize: 15),
      ),
    ),
  );
}
