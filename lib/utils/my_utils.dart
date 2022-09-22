import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyUtils {

  static showSnackBar(BuildContext context, String? text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text ?? ""),
        backgroundColor: Colors.red,
      )
    );
  }

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }


  static getMyToast({required String message}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM_RIGHT,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey.shade300,
    textColor: Colors.black,
    fontSize: 16.0.sp,
  );
}