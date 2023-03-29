import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_catalyst/Screens/navigator_screen.dart';

class LoginProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  bool isLoading = false;

  void setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log(e.toString(), name: 'error signInWithGoogle');
      return null;
    }
  }

  Future<void> login(BuildContext context) async {
    setLoading();
    var result = await signInWithGoogle();
    if (result == null || result.user == null) {
      const SnackBar(
        content: Text('Login Failed'),
      );
    } else {
      moveToHome(context);
    }
    setLoading();
  }

  void moveToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const NavigatorScreen(),
      ),
    );
  }
}
