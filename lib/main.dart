import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Auth/LoginSignUp.dart';
import 'package:students_mitra_flutter/Home/graphs.dart';
import 'package:students_mitra_flutter/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

bool _isSignedIn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
      _isSignedIn = false;
    } else {
      print('User is signed in!');
      _isSignedIn = true;
    }
  });
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
        HomePage.id: (context) => HomePage()
      },
      title: 'Students Mitra',
      theme: Theme.of(context).copyWith(primaryColor: Colors.red),
      home: HomePage(),
    );
  }
}
