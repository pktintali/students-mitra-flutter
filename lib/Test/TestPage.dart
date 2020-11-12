import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Constants/ReUseableCard.dart';
import 'package:students_mitra_flutter/Test/SingleSubject/SingleSubject.dart';
import 'package:students_mitra_flutter/Test/TestScreen.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ReUseableCard(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleSubject()));
                    },
                    //colour: select==Gender.selected1?Colors.green:Colors.white,
                    colour: Colors.white,
                    cardchild: "Single Subject  ",
                  ),
                ),
              ),
              SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: ReUseableCard(
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestScreen()));
                },
                // colour: select==Gender.selected2?Colors.green:Colors.white,
                colour: Colors.white,
                cardchild: "Select Subjects    ",
              )),
              SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: ReUseableCard(
                onPress: () {},
                // colour: select==Gender.selected2?Colors.green:Colors.white,
                colour: Colors.white,
                cardchild: " My All Subjects      ",
              )),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
