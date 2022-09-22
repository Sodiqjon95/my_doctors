import 'package:firebase_auth_part/views/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constanta.dart';
class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCustomButton(
            onTap: () => Navigator.pushNamed(context, adminCategories),
            text: "Categories",
          ),
           SizedBox(height: 30.h),
          MyCustomButton(
            onTap: () => Navigator.pushNamed(context, adminDoctors),
            text: "Doctors",
          ),
           SizedBox(height: 30.h),
        ],
      ),
    );
  }

}
