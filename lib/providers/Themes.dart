import 'package:flutter/cupertino.dart';

class MyTheme with ChangeNotifier {
  bool isDark = false;

  void toogleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
