import 'package:flutter/material.dart';


class SelectButton extends StatelessWidget {
  const SelectButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  TextButton(
      style: TextButton.styleFrom(backgroundColor: Colors.green),
      onPressed: onTap,
      child:  Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}