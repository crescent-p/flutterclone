import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType keyboardType;
  const TextInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPass = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        //rounded corners

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: hintText,
      ),
    );
  }
}
