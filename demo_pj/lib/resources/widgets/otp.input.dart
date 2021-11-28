import 'package:demo_pj/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({Key? key, required this.onChange, required this.isTrue})
      : super(key: key);

  final bool isTrue;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        onChanged: onChange,
        // maxLength: 6,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          // counter: const SizedBox.shrink(),
          fillColor: isTrue
              ? getColorFromHex(cINPUTFIELD_COLOR).withOpacity(0.5)
              : Colors.pinkAccent.withOpacity(0.2),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: isTrue
                  ? const BorderSide(width: 0, style: BorderStyle.none)
                  : const BorderSide(
                      width: 1, style: BorderStyle.solid, color: Colors.red)),
          suffixIcon: isTrue
              ? null : const Icon(
                  Icons.alarm,
                  size: 20,
                ),
          hintText: isTrue ? 'Nhập OTP xác nhận' : 'Input',
        ),
      ),
    );
  }
}
