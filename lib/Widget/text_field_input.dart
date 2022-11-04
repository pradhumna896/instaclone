import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFieldInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final bool isObs;

  const CustomTextFieldInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.keyBoardType,
      this.isObs = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: isObs,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          hintText: hintText,
          filled: true),
    );
  }
}
