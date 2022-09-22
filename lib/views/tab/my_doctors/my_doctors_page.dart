import 'package:firebase_auth_part/data/models/my_doctors/my_doctors_item.dart';
import 'package:firebase_auth_part/view_models/my_doctors_view_model.dart';
import 'package:firebase_auth_part/views/tab/my_doctors/widgets/my_doctors_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/constanta.dart';
import '../../../utils/ui_needs/color.dart';
import '../../../utils/ui_needs/style.dart';

class MyDoctorsPage extends StatefulWidget {
  const MyDoctorsPage({Key? key}) : super(key: key);

  @override
  State<MyDoctorsPage> createState() => _MyDoctorsPageState();
}

class _MyDoctorsPageState extends State<MyDoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
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
        Column(
          children: [
            Container(
                margin:  EdgeInsets.only(top: 51.h, right: 150.w),
                child: Text(
                  " My  Doctors ",
                  style: MyTextStyle.sfProBlack.copyWith(
                    fontSize: 24.sp,
                    color: MyColors.black,
                  ),
                )),
            Expanded(
                child: StreamBuilder<List<MyDoctorsItem>>(
              stream: context.read<MyDoctorsViewModel>().getAllMyDoctors(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  final myDoctors = snapshot.data!;
                  return myDoctors.isNotEmpty
                      ? GridView.count(
                          childAspectRatio: 0.85.h,
                          crossAxisCount: 2,
                          children: List.generate(
                            myDoctors.length,
                            (index) => MyDoctorItemView(
                              myDoctorsItem: myDoctors[index],
                              onTap: () {
                              },
                              onDelete: () {
                                context.read<MyDoctorsViewModel>().deleteMyDoctor(
                                  context: context,
                                  docId: myDoctors[index].myDoctorId,
                                );
                              },
                            ),
                          ))
                      : const Center(
                          child: Text("No My Doctors"),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ))
          ],
        ),
      ]),
    ));
  }
}
