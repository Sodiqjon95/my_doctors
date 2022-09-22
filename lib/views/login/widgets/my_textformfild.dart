import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFormField extends StatelessWidget {
  AuthTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.icon,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  String labelText;
  IconData icon;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: const Color(0xFFFFFFFF),
        filled: true,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      cursorColor: Colors.white,
    );
  }
}

class RegisterAuthTextFormField extends StatelessWidget {
  RegisterAuthTextFormField({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.textInputType,
    required this.controller,
    required this.enterTex
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  String labelText;
  IconData icon;
  TextInputType textInputType;
  String enterTex;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) => email != null && !EmailValidator.validate(email) ? enterTex: null,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: const Color(0xFFFFFFFF),
        filled: true,
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        border: const OutlineInputBorder(),
        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      cursorColor: Colors.white,
    );
  }
}
