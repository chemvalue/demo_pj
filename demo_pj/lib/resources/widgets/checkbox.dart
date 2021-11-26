import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key, required this.valueReturn}) : super(key: key);
  final Function(bool) valueReturn;
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        fillColor: MaterialStateProperty.all(Colors.white),
        side: MaterialStateBorderSide.resolveWith(
              (states) =>
              const BorderSide(width: 2.0, color: Colors.red),
        ),
        checkColor: Colors.red,
        value: value,
        onChanged: (bool? newValue) {
          setState(() {
            value = newValue!;
            widget.valueReturn(newValue);
          });
        });
  }
}
