import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:students_mitra_flutter/Test/NetWorking.dart';
import 'package:students_mitra_flutter/providers/QuestionsDB.dart';

class SheetQuestions with ChangeNotifier {
  List<QuestionsDB> qdb = [];
  int i = 0;
  double marg = 1.6;
  Future<void> getQuestions({String subject}) async {
    final sub =
        "https://sheets.googleapis.com/v4/spreadsheets/1nKZxQH1nAVPPhpSLH1tPlYcW31-ZRM9qi7KoGvpLroc/values/$subject!A2:M11?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc";
    Networking networking = Networking(url: sub);
    var subjectJson = await networking.getData();
    Map<String, dynamic> map = json.decode(subjectJson);
    for (var i in map['values']) {
      // if (i[0] != 'id') {
      var question = QuestionsDB.fromList(i);
      if (question != null) {
        qdb.add(question);
      }
      // }
    }
    print('GETTINGGGGGGGGGGGGGGGGGGG');
    for (var i in qdb) {
      print(i.question);
    }
    notifyListeners();
  }

  void resetQDB() {
    qdb = [];
    i = 0;
    notifyListeners();
  }

  void increment() {
    if (i < 9) {
      i++;
    }
    notifyListeners();
  }

  void setMargin({double value}) {
    marg = value;
    notifyListeners();
  }
}
