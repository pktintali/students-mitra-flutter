import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Auth/LoginSignUp.dart';
import 'package:students_mitra_flutter/Home/graphs.dart';
import 'package:students_mitra_flutter/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:students_mitra_flutter/Profile/profile.dart';

bool _isSignedIn = false;
// bool _isSignedIn = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final user = FirebaseAuth.instance.currentUser;
  _isSignedIn = user != null ? true : false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: _isSignedIn ? HomePage.id : LoginSignUp.id,
      routes: {
        LoginSignUp.id: (context) => LoginSignUp(),
        Graphs.id: (context) => Graphs(),
        HomePage.id: (context) => HomePage(),
        Profile.id: (context) => Profile(),
      },
      title: 'StudentMitra',
      theme: Theme.of(context).copyWith(primaryColor: Colors.red),
      home: HomePage(),
    );
  }
}
