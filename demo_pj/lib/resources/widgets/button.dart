import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant.dart';
import '../utilities.dart';

Widget customButton(
    {required String color,
    required String text,
    Function()? function,
    bool check = true}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:
            check ? getColorFromHex(color) : getColorFromHex(cINPUTFIELD_COLOR),
      ),
      child: Text(
        text,
        style: check
            ? TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)
            : TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                fontSize: 15),
      ),
    ),
  );
}
