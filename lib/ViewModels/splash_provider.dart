import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_catalyst/Screens/navigator_screen.dart';
import 'package:test_catalyst/Screens/onboard_screen.dart';

class SplashProvider with ChangeNotifier {
  User? currentUser;

  Future<void> isAlreadyLogin(BuildContext context) async {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      moveToNavigator(context);
    } else {
      moveToOnBoard(context);
    }
  }

  void moveToNavigator(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigatorScreen(),
        ),
      ),
    );
  }

  void moveToOnBoard(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardScreen(),
        ),
      ),
    );
  }
}
