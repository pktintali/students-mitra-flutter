import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:students_mitra_flutter/Test/NetWorking.dart';
import 'package:students_mitra_flutter/providers/SubjectDB.dart';

class SheetSubjects with ChangeNotifier {
  List<SubjectDB> db = [];
  final url =
      "https://sheets.googleapis.com/v4/spreadsheets/1sQhy4Ex1XztFzMU3_nvpc-9par8AcIIwsksm9vhlM_E/values/subject?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc";
  Future<void> getSubjects() async {
    Networking networking = Networking(url: url);
    var subjectJson = await networking.getData();
    Map<String, dynamic> map = json.decode(subjectJson);
    for (var i in map['values']) {
      if (i[0] != 'id') {
        var sdb = SubjectDB.fromList(i);
        if (sdb != null) {
          db.add(sdb);
        }
      }
    }
    print('GETTINGGGGGGGGGGGGGGGGGGG');
    // for (var i in db) {
    //   print(i.fullName);
    // }
    notifyListeners();
  }
}
