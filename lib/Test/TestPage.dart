import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_mitra_flutter/Constants/ReUseableCard.dart';
import 'package:students_mitra_flutter/Test/SingleSubject/SingleSubject.dart';
import 'package:students_mitra_flutter/Test/SubjectList.dart';
import 'package:students_mitra_flutter/providers/SheetSubjects.dart';
import '../Profile/profile.dart';
import '../game/game_zone.dart';

class TestPage extends StatefulWidget {
  static final String id = "test";
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Profile.id);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Select any one",
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ReUseableCard(
                    onPress: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleSubject(),
                        ),
                      );
                      var sub = context.read<SheetSubjects>();
                      if (sub.db.length < 1) {
                        await sub.getSubjects();
                      }
                    },
                    //colour: select==Gender.selected1?Colors.green:Colors.white,
                    colour: Colors.white,
                    cardtext: "Single",
                  ),
                ),
              ),
              // SizedBox(
              //   width: 6.0,
              // ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ReUseableCard(
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SubjectList()));
                  },
                  // colour: select==Gender.selected2?Colors.green:Colors.white,
                  colour: Colors.white,
                  cardtext: "Select",
                ),
              )),
              // SizedBox(
              //   width: 6.0,
              // ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ReUseableCard(
                  onPress: () {},
                  // colour: select==Gender.selected2?Colors.green:Colors.white,
                  colour: Colors.white,
                  cardtext: "Active",
                ),
              )),
            ],
          ),
          // SizedBox(
          //   height: 30.0,
          // ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ReUseableCard(
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GameLogin()));
                  },
                  // colour: select==Gender.selected2?Colors.green:Colors.white,
                  colour: Colors.white,
                  cardtext: "Game Zone",
                  isGameZone: true,
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
