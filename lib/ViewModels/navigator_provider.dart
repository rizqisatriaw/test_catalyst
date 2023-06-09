import 'package:flutter/material.dart';

class NavigatorProvider extends ChangeNotifier {
  var _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(var index) {
    _currentIndex = index;
    notifyListeners();
  }
}
