import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_part/data/models/my_doctors/my_doctors_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../utils/my_utils.dart';

class MyDoctorsViewModel {
  final FirebaseFirestore _fireStore;

  MyDoctorsViewModel({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  Future<void> addMyDoc({required BuildContext context, required MyDoctorsItem myDoctorsItem}) async {
    try {
      var newMyDoctors = await _fireStore.collection("my_doctors").add(myDoctorsItem.toJson());
      await _fireStore.collection("my_doctors").doc(newMyDoctors.id).update({
        "my_doctor_id": newMyDoctors.id,
      });

      MyUtils.getMyToast(message: "Muvaffaqiyatli qo'shildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> updateOrder({
    required BuildContext context,
    required MyDoctorsItem myDoctorsItem,
    required String docId,
  }) async {
    try {
      await _fireStore.collection("my_doctors").doc(docId).update(myDoctorsItem.toJson());
      MyUtils.getMyToast(message: "Muvaffaqiyatli update bo'ldi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  // Future<void> updateMyDoctorsStatus({
  //   required String status,
  //   required String docId,
  // }) async {
  //   try {
  //     await _fireStore.collection("orders").doc(docId).update({"order_status": status});
  //     MyUtils.getMyToast(message: "Status muvaffaqiyatli update bo'ldi");
  //   } on FirebaseException catch (e) {
  //     MyUtils.getMyToast(message: e.message.toString());
  //   }
  // }

  // Future<void> cancelOrder({
  //   required BuildContext context,
  //   required MyDoctorsItem myDoctorsItem,
  // }) async {
  //   try {
  //     //1
  //     await _fireStore.collection("my_doctors").doc(myDoctorsItem.myDoctorId).delete();
  //     //2
  //     var pr = await _fireStore.collection("doctors").doc(myDoctorsItem.doctorId).get();
  //
  //     DoctorsItem productItem = DoctorsItem(
  //       createdAt: createdAt,
  //       categoryId: categoryId,
  //       description: description,
  //       doctorId: doctorId,
  //       price: price,
  //       doctorImages: doctorImages,
  //       doctorName: doctorName,
  //       level: level,
  //       specialist: specialist,
  //       phoneNumber: phoneNumber,
  //     );
  //     //3
  //     await _fireStore.collection("products").doc(orderItem.productId).update({
  //       "count": productItem.count + orderItem.count,
  //     });
  //
  //     MyUtils.getMyToast(message: "Muvaffaqiyatli cancel bo'ldi");
  //   } on FirebaseException catch (e) {
  //     MyUtils.showSnackBar(context, e.message);
  //   }
  // }

  Future<void> deleteMyDoctor({
    required BuildContext context,
    required String docId,
  }) async {
    try {
      await _fireStore.collection("my_doctors").doc(docId).delete();
      MyUtils.getMyToast(message: "Muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Stream<List<MyDoctorsItem>> getAllMyDoctors() => _fireStore.collection('my_doctors').snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => MyDoctorsItem.fromJson(doc.data())).toList(),
      );

  Stream<List<MyDoctorsItem>> getAllUserOrders({required String userId}) => _fireStore.collection('my_doctors').where("user_id", isEqualTo: userId).snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => MyDoctorsItem.fromJson(doc.data())).toList(),
      );

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getOrdersForAdmin() => _fireStore.collection('my_doctors').snapshots().map(
        (snapshot) => snapshot.docs,
      );

  Future<void> updateUser({required String imagePath}) {
    CollectionReference users = _fireStore.collection('users');
    return rootBundle
        .load('assets/images/sample.jpg')
        .then((bytes) => bytes.buffer.asUint8List())
        .then((avatar) {
          return users.doc('ABC123').update({'info.avatar': Blob(avatar)});
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
