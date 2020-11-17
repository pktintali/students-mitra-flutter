import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Auth/LoginPage.dart';
import 'package:students_mitra_flutter/Auth/SignUpPage.dart';
import 'package:students_mitra_flutter/Explore/Explore.dart';
import 'package:students_mitra_flutter/Test/TestPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  List<Widget> tabPages = [
    Explore(),
    LoginPage(),
    TestPage(),
    SignUpPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Explore"),
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(

            title: Text("Login"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(

            title: Text("Test"),
            icon: Icon(Icons.speaker_notes),
          ),
        ],
      ),
    );
  }
}
