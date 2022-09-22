import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onEditTap,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.only(left: 8.w,top: 16.h,right: 8.w,bottom: 16.h),
      padding:  EdgeInsets.all(8.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 8,
          color: Colors.grey.shade400,
          offset: const Offset(3, 4),
          spreadRadius: 5,
        )
      ]),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              )
            ],
          )),
          IconButton(
              onPressed: onEditTap,
              icon:  Icon(
                Icons.edit,
                color: Colors.blue,
                size: 24.sp,
              ))
        ],
      ),
    );
  }
}
