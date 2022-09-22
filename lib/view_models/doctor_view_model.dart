import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_part/data/models/doctors/doctors_item.dart';
import 'package:flutter/cupertino.dart';

import '../utils/my_utils.dart';

class DoctorViewModel {
  final FirebaseFirestore _fireStore;

  DoctorViewModel({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  Future<void> addDoctors({
    required BuildContext context,
    required DoctorsItem categoryItem,
  }) async {
    try {
      var newDoctor = await _fireStore.collection("doctors").add(categoryItem.toJson());
      await _fireStore.collection("doctors").doc(newDoctor.id).update({"doctor_id": newDoctor.id});
      MyUtils.getMyToast(message: "Muvaffaqiyatli qo'shildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> deleteDoctor({
    required BuildContext context,
    required String docId,
  }) async {
    try {
      await _fireStore.collection("doctors").doc(docId).delete();
      MyUtils.getMyToast(message: "Muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Stream<List<DoctorsItem>> getDoctors() =>
      _fireStore.collection('doctors').snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => DoctorsItem.fromJson(doc.data()))
            .toList(),
      );



}
