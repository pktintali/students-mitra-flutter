import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/HomePage.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students Mitra',
      theme: Theme.of(context).copyWith(primaryColor: Colors.red),
      home: HomePage(),
    );
  }
}
