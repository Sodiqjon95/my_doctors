import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_part/utils/my_utils.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/category/category_item.dart';

class CategoryViewModel {
  final FirebaseFirestore _fireStore;

  CategoryViewModel({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  Future<void> addCategoryBySet({
    required BuildContext context,
    required CategoryItem categoryItem,
  }) async {
    try {
      await _fireStore.collection("categories").doc("my_nimadurda").set(categoryItem.toJson());
      MyUtils.showSnackBar(context, "Muvaffaqqiyatli qoshildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }
  Future<void> addCategory({
    required BuildContext context,
    required CategoryItem categoryItem,
  }) async {
    try {
      var newCategory =
      await _fireStore.collection("categories").add(categoryItem.toJson());
      await _fireStore
          .collection("categories")
          .doc(newCategory.id)
          .update({"category_id": newCategory.id});
      MyUtils.getMyToast(message: "Muvaffaqiyatli qo'shildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> updateCategory({
    required BuildContext context,
    required CategoryItem categoryItem,
    required String docId,
  }) async {
    try {
      await _fireStore
          .collection("categories")
          .doc(docId)
          .update(categoryItem.toJson());
      MyUtils.showSnackBar(context, "Muvaffaqiyatli update bo'ldi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> deleteCategory({
    required BuildContext context,
    required String docId,
  }) async {
    try {
      await _fireStore.collection("categories").doc(docId).delete();
      MyUtils.showSnackBar(context, "Muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }
  Stream<List<CategoryItem>> getCategories() =>
      _fireStore.collection('categories').snapshots().map(
            (snapshot) => snapshot.docs
            .map((doc) => CategoryItem.fromJson(doc.data()))
            .toList(),
      );

  // Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
  //     getCategoriesForAdmin() =>
  //         _fireStore.collection('categories').snapshots().map(
  //               (snapshot) => snapshot.docs,
  //             );

  Future<CategoryItem> getCategoryByDocId({required String docId}) async {
    var data = await _fireStore.collection('categories').doc(docId).get();
    CategoryItem categoryItem =
    CategoryItem.fromJson(data.data() as Map<String, dynamic>);
    return categoryItem;
  }
}



