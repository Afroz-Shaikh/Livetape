import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:livetape/utils/utils.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _firebaseStore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> signinWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          //save the user in the firestore dB
          await _firebaseStore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'userImage': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnakBar(context, e.toString());
      res = false;
    }
    return res;
  }

  singOutwithGoogle() async {
    try {
      _auth.signOut();
    } catch (e) {}
  }

  //Delete Account
  Future<void> deleteUser(BuildContext context) async {
    try {
      _auth.currentUser!.delete();
      // _auth.
    } on FirebaseAuthException catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
