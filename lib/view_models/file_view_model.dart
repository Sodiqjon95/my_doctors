import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_part/utils/my_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileViewModel extends ChangeNotifier {
  Future<void> uploadUserImage(
      PlatformFile pickedFile,
      BuildContext context,
      ) async {
    try {
      MyUtils.showLoader(context);
      String storagePath = "files/images/${pickedFile.name}";
      var ref = FirebaseStorage.instance.ref().child(storagePath);
      var task = await ref.putFile(File(pickedFile.path!));
      String downloadUrl = await task.ref.getDownloadURL();
      var auth = FirebaseAuth.instance.currentUser;
      await auth!.updatePhotoURL(downloadUrl);
      Navigator.pop(context);
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }
  Future<String> uploadImage(
    XFile file,
    BuildContext context,
  ) async {
    try {
      MyUtils.showLoader(context);
      String storagePath = "files/images/${file.name}";
      var ref = FirebaseStorage.instance.ref().child(storagePath);
      var task = await ref.putFile(File(file.path));
      String downloadUrl = await task.ref.getDownloadURL();
      Navigator.pop(context);
      return downloadUrl;
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
      throw Exception();
    }
  }

  Future<List<String>> uploadDoctorImages(
    BuildContext context,
    List<XFile> images,
  ) async {
    MyUtils.showLoader(context);
    List<String> imageUrls = [];

    for (XFile file in images) {
      String storagePath = "files/images/${file.name}";

      var ref = FirebaseStorage.instance.ref().child(storagePath);
      var task = await ref.putFile(File(file.path));
      String downloadUrl = await task.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    Navigator.pop(context);
    return imageUrls;
  }
}
