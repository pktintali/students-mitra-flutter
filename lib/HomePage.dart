import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Explore/Explore.dart';
import 'package:students_mitra_flutter/Home/graphs.dart';
import 'package:students_mitra_flutter/Test/TestPage.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  List<Widget> tabPages = [
    Explore(),
    Graphs(),
    TestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          size: 30,
          color: Colors.red,
        ),
        unselectedIconTheme: IconThemeData(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[100],
        // selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.withOpacity(.60),

        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: "Login",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Test",
            icon: Icon(Icons.speaker_notes),
          ),
        ],
      ),
    );
  }
}
