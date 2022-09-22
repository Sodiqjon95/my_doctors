import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.blueAccent,
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: 14,
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
