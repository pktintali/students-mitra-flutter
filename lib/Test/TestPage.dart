import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Constants/ReUseableCard.dart';
import 'package:students_mitra_flutter/Test/SingleSubject/SingleSubject.dart';
import 'package:students_mitra_flutter/Test/SubjectList.dart';
import 'profile.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.person,),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
        },),

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
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
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
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: ReUseableCard(
                     onPress: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SubjectList()));
                },
                // colour: select==Gender.selected2?Colors.green:Colors.white,
                colour: Colors.white,
                cardchild:"Select Subjects",
              ),
                  )),
              SizedBox(
                width: 6.0,
              ),
              Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: ReUseableCard(
                onPress: () {},
                // colour: select==Gender.selected2?Colors.green:Colors.white,
                colour: Colors.white,
                cardchild: " My All Subjects      ",
              ),
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
