import 'package:flutter/material.dart';
import '../../constant.dart';
import '../utilities.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.color, required this.text, required this.function,  this.check = true}) : super(key: key);

  final String color;
  final String text;
  final Function() function;
  final bool check;

  @override
  Widget build(BuildContext context) {
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
}

