import 'package:students_mitra_flutter/index.dart';

class UserAnswers with ChangeNotifier {
  String tempAns;
  bool answered = false;
  int correct = 0;
  int incorrect = 0;
  int skipped = 0;
  int timeOut = 0;

  void updateTempAns(String ans) {
    tempAns = ans;
    notifyListeners();
  }

  void incCorrect() {
    correct++;
  }

  void incInCorrect() {
    incorrect++;
  }

  void incSkipped() {
    skipped++;
  }

  void incTimeOut() {
    timeOut++;
  }

  void toogleAnswered() {
    answered = !answered;
    notifyListeners();
  }
}
