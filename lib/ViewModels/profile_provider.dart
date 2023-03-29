import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_catalyst/Screens/login_screen.dart';

class ProfileProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  GoogleSignIn googleSignIn = GoogleSignIn();

  void increment() {
    _count++;
    notifyListeners();
  }

  bool isLoading = false;

  void setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  // Future<void> signOutWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //
  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //
  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signOut();
  //   } catch (e) {
  //     log(e.toString(), name: 'error signInWithGoogle');
  //     return;
  //   }
  // }

  Future<void> signOut(BuildContext context) async {
    setLoading();
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    moveToLogin(context);
  }

  // Future<void> logout(BuildContext context) async {
  //   setLoading();
  //   var result = await signOutWithGoogle();
  //   if (result != null || result.user != null) {
  //     const SnackBar(
  //       content: Text('Logout Failed'),
  //     );
  //   } else {
  //     moveToLogin(context);
  //   }
  //   setLoading();
  // }

  void moveToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
