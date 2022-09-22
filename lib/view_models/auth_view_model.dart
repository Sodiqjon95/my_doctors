import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_part/utils/my_utils.dart';
import 'package:flutter/cupertino.dart';

import '../data/local/storage.dart';

class AuthViewModel{
  final FirebaseAuth _auth;

  AuthViewModel({required FirebaseAuth auth}) : _auth = auth;

  Future<void> signUp(
      {required String email,
        required String password,
        required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await StorageRepository.putString("auth_state", "registered");
    } on FirebaseAuthException catch (e) {
      MyUtils.getMyToast(message: e.message.toString());
    }
  }
  Future<void> signIn({
    required String email,
    required String password,

    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> deleteAccount (BuildContext context) async {
    try{
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> updateDisplayName ({
  required BuildContext context,
    required String displayName,
}) async {
    try {
      await _auth.currentUser!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e){
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> updateEmail ({
  required BuildContext context,
    required String email
})async{
    try{
      await _auth.currentUser!.updateEmail(email);
    } on FirebaseAuthException catch (e){
      MyUtils.showSnackBar(context, e.message);
    }
  }

Future<void> updatePassword ({
  required BuildContext context,
  required String password,
})async {
    try{
      await _auth.currentUser!.updatePassword(password);
    } on FirebaseAuthException catch (e){
      MyUtils.showSnackBar(context, e.message);
    }
}

//  User get user => _auth.currentUser!;

Stream<User?> authState() async*{
    yield* FirebaseAuth.instance.authStateChanges();
}

Stream<User?> get userInfoChanges => FirebaseAuth.instance.userChanges();

}
