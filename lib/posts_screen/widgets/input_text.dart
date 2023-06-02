import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? placeholder;
  final double? fontSize;
  final Color? textColor;
  final int? maxLines;
  final TextEditingController? controller;

  const InputText({
    super.key,
    this.placeholder,
    this.fontSize,
    this.textColor,
    this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 33, 36, 39),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: fontSize,
            color: const Color.fromARGB(255, 164, 164, 164),
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
