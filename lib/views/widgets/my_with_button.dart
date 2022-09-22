import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWhiteButton extends StatelessWidget {
  const MyWhiteButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      height: 53.h,
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF0EBE7F),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
             EdgeInsets.symmetric(
              vertical: 10.w,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          Icon(
              Icons.arrow_forward,
              size: 32.sp,
            ),
          Text(
                " Register ",
                style: TextStyle(fontSize: 24.sp),
              ),

        ],)
      ),
    );

  }
}