import 'package:demo_pj/models/temp_model.dart';
import 'package:flutter/material.dart';
import '../utilities.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    Key? key,
    required this.color,
    required this.hint,
    required this.hasIcon,
    required this.items,
    required this.valueReturn,
  }) : super(key: key);

  final String color;
  final String hint;
  final bool hasIcon;
  final List<TempModel>? items;

  final Function(int) valueReturn;

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late int value;
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: getColorFromHex(widget.color).withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: check ? value : null,
          onChanged: (int? newValue) {
            // chua cap nhat duoc thong qua getx
            setState(() {
              value = newValue!;
              check = true;
              widget.valueReturn(newValue);
            }
            );
          },
          items: widget.items == null
              ? null
              : widget.items!.map((TempModel item) {
                  return DropdownMenuItem<int>(
                    value: item.id,
                    child: Text(item.name),
                  );
                }).toList(),
          hint: widget.hasIcon
              ? Row(
                  children: [
                    const Icon(Icons.store),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(widget.hint),
                  ],
                )
              : Text(widget.hint),
        ),
      ),
    );
  }
}
