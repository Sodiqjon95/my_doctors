import 'package:firebase_auth_part/view_models/auth_view_model.dart';
import 'package:firebase_auth_part/views/login/widgets/my_textformfild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils.dart';
import '../../utils/ui_needs/color.dart';
import '../../utils/ui_needs/style.dart';
import '../widgets/my_with_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
            top: 0.h,
            left: 0.w,
            child: Container(
              width: 350.w,
              height: 450.h,
              decoration:  BoxDecoration(
                  gradient: RadialGradient(
                      center: const Alignment(-0.5, -0.2),
                      colors: const [
                        Color.fromARGB(99, 33, 216, 216),
                        Colors.white,
                      ],
                      radius: 0.6.r)),
            )),
        Positioned(
            top: 500.h,
            right: 0.w,
            child: Container(
              width: 350.w,
              height: 450.h,
              decoration:  BoxDecoration(
                  gradient: RadialGradient(
                      center: const Alignment(0.5, 0.1),
                      colors: const [
                        Color.fromARGB(44, 11, 255, 22),
                        Colors.white,
                      ],
                      radius: 0.6.r)),
            )),
        Padding(
          padding:  EdgeInsets.all(16.0.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   // SizedBox(height: 20.h),
                  SizedBox(height: 300.h, child: Image.network("https://myaccount.mytnb.com.my/assets/img/register-illust.png")),
                  SizedBox(height: 100.h,child: Image.asset("assets/images/img.png")),
                  // SizedBox(height: 10.h),

                  RegisterAuthTextFormField(
                    icon: Icons.email,
                    labelText: "Email",
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    enterTex: 'enter a valid email',
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) => password != null && password.length < 6 ? "Enter at least 6 character !" : null,
                    style: MyTextStyle.sfProRegular.copyWith(
                      color: MyColors.black,
                      fontSize: 17.sp,
                    ),
                    decoration:  InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) => password != null && password.length < 6 ? "Enter at least 6 character !" : null,
                    style: MyTextStyle.sfProRegular.copyWith(
                      color: MyColors.black,
                      fontSize: 17.sp,
                    ),
                    decoration:  InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.h),

                  MyWhiteButton(onTap: signUp, text: "Register"),
                   SizedBox(height: 23.h),
                  RichText(
                      text: TextSpan(style: MyTextStyle.sfProRegular.copyWith(color: const Color(0xFF0EBE7F), fontSize: 18.sp), text: "Have an account?", children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                      text: " Log in ",
                      style: MyTextStyle.sfProBold.copyWith(
                        color: const Color(0xFF0EBE7F),
                        fontSize: 18.sp,
                      ),
                    ),
                  ])),
                  SizedBox(height: 170.h,),

                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (confirmPassword == password) {
      context.read<AuthViewModel>().signUp(
            email: email,
            password: password,
            context: context,
          );
    } else {
      MyUtils.getMyToast(message: "Passwords don't match!");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
