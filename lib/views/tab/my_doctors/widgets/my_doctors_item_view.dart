import 'package:firebase_auth_part/data/models/my_doctors/my_doctors_item.dart';
import 'package:firebase_auth_part/utils/ui_needs/color.dart';
import 'package:firebase_auth_part/utils/ui_needs/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDoctorItemView extends StatelessWidget {
  const MyDoctorItemView({
    Key? key,
    required this.myDoctorsItem,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);
  final MyDoctorsItem myDoctorsItem;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(6.h),
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 6.r,
                  blurRadius: 5.r,
                  offset: const Offset(3, 4),
                  color: Colors.grey.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.network(
                    myDoctorsItem.doctorImages[0],
                    width: 100.h,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // SizedBox(height: 10.h),
              Expanded(
                flex: 1,
                child: Text(
                  "Dr. ${myDoctorsItem.orderProductName}",
                  style: MyTextStyle.sfProBlack.copyWith(fontSize: 15.sp),
                ),
              ),
              // SizedBox(height: 10.h),
              Expanded(
                flex: 1,
                child: Text(
                  "Specialist ${myDoctorsItem.specialist}",
                  style: MyTextStyle.sfProLight.copyWith(
                    fontSize: 12.sp,
                    color: MyColors.C_2AAB08,
                  ),
                ),
              ),
              // SizedBox(height: 10.h),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: onDelete,
                  child: Text(
                    "delete my doctor",
                    style: MyTextStyle.sfProBlack.copyWith(color: Colors.red),
                  ),
                ),
              ),
              // SizedBox(height: 10.h),
            ])));
  }
}
