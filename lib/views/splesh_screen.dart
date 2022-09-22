import 'package:firebase_auth_part/utils/constanta.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 3400));
    Navigator.pop(context, mainPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Lottie.asset("assets/lottie/5medical-icons.json"))],
        ),
    );
  }
}
