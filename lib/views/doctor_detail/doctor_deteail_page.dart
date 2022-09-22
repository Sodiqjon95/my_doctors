import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:firebase_auth_part/data/models/my_doctors/my_doctors_item.dart';
import 'package:firebase_auth_part/utils/ui_needs/style.dart';
import 'package:firebase_auth_part/view_models/my_doctors_view_model.dart';
import 'package:firebase_auth_part/views/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/ui_needs/color.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({Key? key, required this.doctorsItem}) : super(key: key);
  final DoctorsItem doctorsItem;

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    DoctorsItem doctorsItem = widget.doctorsItem;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
              top: 0.h,
              left: 0.w,
              child: Container(
                width: 350.w,
                height: 450.h,
                decoration: BoxDecoration(
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
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        center: const Alignment(0.5, 0.1),
                        colors: const [
                          Color.fromARGB(44, 11, 255, 22),
                          Colors.white,
                        ],
                        radius: 0.6.r)),
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20.h, right: 150.w),
                    child: Text(
                      "Info Doctor",
                      style: MyTextStyle.sfProBlack.copyWith(
                        fontSize: 24.sp,
                        color: MyColors.black,
                      ),
                    )),
                SizedBox(
                  height: 350.h,
                  // width: double.infinity,
                  child: CarouselSlider(
                    items: List.generate(doctorsItem.doctorImages.length, (index) {
                      var t = doctorsItem.doctorImages[index];
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: Image.network(
                            t,
                            width: 280.w,
                            fit: BoxFit.fill,
                          ));
                    }),
                    options: CarouselOptions(height: 300.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 20.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Patent Information",
                      style: MyTextStyle.sfProRegular.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("Full Name:  "),
                          Text(doctorsItem.doctorName),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          const Text("level:  "),
                          Text("${doctorsItem.level.toString()} years"),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          const Text("Phone :  "),
                          Text(doctorsItem.phoneNumber.toString()),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          const Text("Price:  "),
                          Text("${doctorsItem.price.toString()} \$"),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          const Text("Specialist :  "),
                          Text(doctorsItem.specialist),
                        ],
                      ),
                      // SizedBox(height: 10.h),

                       SizedBox(
                         height: 200,
                         child: ExpansionTile(
                          title: const Text("Description"),
                          // subtitle: Text('Trailing expansion arrow icon'),
                          children:[
                            ListTile(title: Text(
                              doctorsItem.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                            )),
                          ],
                      ),
                       ),
                    ],
                  ),
                ),
                MyCustomButton(
                    onTap: () {
                      MyDoctorsItem myDoctorsItem = MyDoctorsItem(
                        createdAt: DateTime.now(),
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        totalPrice: widget.doctorsItem.price,
                        orderProductName: widget.doctorsItem.doctorName,
                        doctorId: widget.doctorsItem.doctorId,
                        myDoctorId: DateTime.now().toString(),
                        doctorImages: widget.doctorsItem.doctorImages,
                        specialist: widget.doctorsItem.specialist,
                      );

                      context.read<MyDoctorsViewModel>().addMyDoc(context: context, myDoctorsItem: myDoctorsItem);
                    },
                    text: "Add My Doctors")
              ],
            ),
          ),
        ]));
  }
}
