import 'package:flutter/material.dart';
import 'package:pos_portal/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  int minLines = 2;
  int maxLines = 10;
  int maxLength = 500; // Default max length

  void updateLinesAndLength({int? newMinLines, int? newMaxLines, int? newMaxLength}) {
    setState(() {
      if (newMinLines != null) {
        minLines = newMinLines;
      }
      if (newMaxLines != null) {
        maxLines = newMaxLines;
      }
      if (newMaxLength != null) {
        maxLength = newMaxLength;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: OutlineInputBorder(),
        hintStyle: TextStyle(color: MyColors.neutral), // Mengatur warna hintText menjadi abu-abu
        labelStyle: TextStyle(color: MyColors.neutral), // Mengatur warna labelText menjadi abu-abu
      ),
    );
  }
}

