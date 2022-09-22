import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:firebase_auth_part/utils/ui_needs/color.dart';
import 'package:firebase_auth_part/utils/ui_needs/style.dart';
import 'package:flutter/material.dart';

class DoctorItemView extends StatelessWidget {
  const DoctorItemView({Key? key, required this.doctorsItem, required this.onTap}) : super(key: key);
  final DoctorsItem doctorsItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 6,
                  blurRadius: 5,
                  offset: const Offset(3, 4),
                  color: Colors.grey.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //  Positioned(
              //   right: 0,
              //   top: 6,
              //   bottom: 10,
              //   child: IconButton(onPressed: (){
              //
              //   }, icon: const Icon(Icons.favorite_border_rounded,),
              // )),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    doctorsItem.doctorImages[0],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Text(
                "Dr. ${doctorsItem.doctorName}",
                style: MyTextStyle.sfProBlack.copyWith(fontSize: 15),
              ),
              Center(
                child: Text(
                  "Specialist ${doctorsItem.specialist}",
                  style: MyTextStyle.sfProLight.copyWith(
                    fontSize: 12,
                    color: MyColors.C_2AAB08,
                  ),
                ),
              ),
            ])));
  }
}
