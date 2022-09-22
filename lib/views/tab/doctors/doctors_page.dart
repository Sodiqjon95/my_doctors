import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:firebase_auth_part/view_models/doctor_view_model.dart';
import 'package:firebase_auth_part/views/tab/doctors/widgets/doctor_item_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constanta.dart';
import '../../../utils/ui_needs/color.dart';
import '../../../utils/ui_needs/style.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 350,
              height: 450,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment(-0.5, -0.2),
                      colors: [
                        Color.fromARGB(99, 33, 216, 216),
                        Colors.white,
                      ],
                      radius: 0.6)),
            )),
        Positioned(
            top: 500,
            right: 0,
            child: Container(
              width: 350,
              height: 450,
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment(0.5, 0.1),
                      colors: [
                        Color.fromARGB(44, 11, 255, 22),
                        Colors.white,
                      ],
                      radius: 0.6)),
            )),
        Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 51, right: 150),
                child: Text(
                  "Favourite Doctors",
                  style: MyTextStyle.sfProBlack.copyWith(
                    fontSize: 24,
                    color: MyColors.black,
                  ),
                )),

            Expanded(
                child: StreamBuilder<List<DoctorsItem>>(
              stream: context.read<DoctorViewModel>().getDoctors(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  final doctors = snapshot.data!;
                  return doctors.isNotEmpty
                      ? GridView.count(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                          children: List.generate(
                              doctors.length,
                              (index) => DoctorItemView(
                                  doctorsItem: doctors[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      doctorDetail,
                                      arguments: doctors[index],
                                    );
                                  })),
                        )
                      : const Center(
                          child: Text("List Empty"),
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
    );
  }
}
