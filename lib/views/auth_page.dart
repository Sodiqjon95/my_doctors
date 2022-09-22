import 'package:firebase_auth_part/views/login/login.dart';
import 'package:firebase_auth_part/views/login/register.dart';
import 'package:flutter/material.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = true;

  @override
  Widget build(BuildContext context) {
    return isLogged
        ? LoginScreen(onClickSignUp: switchAuthPages)
        : RegisterScreen(onClickedSignIn: switchAuthPages);
  }
  void switchAuthPages() => setState(() {
    isLogged = !isLogged;
  });
}