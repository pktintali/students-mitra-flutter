import 'package:flutter/material.dart';

class SubjectConfig with ChangeNotifier {
  String fullName;
  String shortName;
  bool isSelected = false;

  set fName(String fname) => fullName = fname;
  set sName(String sname) => shortName = sname;

  void toogleSelection() {
    isSelected = !isSelected;
    notifyListeners();
  }

  void updateShortName(String name) {
    shortName = name;
    notifyListeners();
  }

  void resetSelected() {
    shortName = null;
    fullName = null;
    notifyListeners();
  }
}
