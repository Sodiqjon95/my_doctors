import 'package:flutter/material.dart';

class UniversalTextInput extends StatelessWidget {
  const UniversalTextInput({
    Key? key,
    required this.hintText,
    required this.textController,
    required this.textInputType,
    required this.textInputAction,
  }) : super(key: key);

  final String hintText;
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 18, color: Colors.black),
      controller: textController,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration:
      InputDecoration(hintText: hintText, border: OutlineInputBorder()),
    );
  }
}
