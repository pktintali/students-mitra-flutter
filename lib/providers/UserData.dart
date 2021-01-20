import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;

  String get userEmail => user.email;
  String get userName => user.displayName;
  String get userLogo => user.photoURL;
  bool get isVerified => user.emailVerified;

  List<dynamic> activeSub;
  // List<dynamic> get getActiveSub => ac;
  Future<List<dynamic>> fetchActiveSub() async {
    print('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(this.userEmail)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data();
        activeSub = data['activeSubject'];
      } else {
        print('Document does not exist on the database');
      }
    });
    notifyListeners();
    return [];
  }
}
