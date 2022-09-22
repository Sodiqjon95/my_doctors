import 'package:firebase_auth_part/view_models/auth_view_model.dart';
import 'package:firebase_auth_part/views/login/widgets/my_textformfild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.onClickSignUp}) : super(key: key);
  final VoidCallback onClickSignUp;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
            padding:  EdgeInsets.all(16.h),
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 20.h),

                SizedBox(height: 350.h, child: Image.network("https://egymerch.com/site_assets/assets/imgs/login/login.png")),
                Image.asset("assets/images/img.png"),
                SizedBox(height: 20.h),

                AuthTextFormField(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  labelText: 'email',
                  icon: Icons.email,
                ),
                SizedBox(height: 10.h),
                AuthTextFormField(
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  labelText: "Password",
                  icon: Icons.lock,
                ),
                SizedBox(height: 35.h),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(minimumSize:  Size.fromHeight(60.h),backgroundColor: Color(0xFF0EBE7F)),
                  onPressed: signIn,
                  icon:  Icon(
                    Icons.lock_open,
                    size: 32.sp,
                  ),
                  label:  Text(
                    "Sign in",
                    style: TextStyle(fontSize: 24.sp),
                  ),
                ),
                SizedBox(height: 20.h),

                RichText(
                  text: TextSpan(
                    style:  TextStyle(color: Colors.teal, fontSize: 18.sp),
                    text: "No Account  ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickSignUp,
                        text: "Register",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 170.h,),
              ],
        ),
            ),
          ),
      ]),
    );
  }

  Future<void> signIn() async {
    context.read<AuthViewModel>().signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          context: context,
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
