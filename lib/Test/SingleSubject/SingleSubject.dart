import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_text/floating_text.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Test/AlbumCard.dart';
import 'package:students_mitra_flutter/Test/DataFetching2.dart';
import 'package:students_mitra_flutter/Test/QuestionMaker.dart';

class SingleSubject extends StatefulWidget {
  @override
  _SingleSubjectState createState() => _SingleSubjectState();
}

class _SingleSubjectState extends State<SingleSubject> {
  var url1 =
      "https://sheets.googleapis.com/v4/spreadsheets/1sQhy4Ex1XztFzMU3_nvpc-9par8AcIIwsksm9vhlM_E/values/subject?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc";
  StreamController<int> streamController = new StreamController<int>();
  Future<dynamic> album;
  String subject;
  List<Widget> myTile = [];
  List<Color> mainColor = [];

  CollectionReference profile =
      FirebaseFirestore.instance.collection('usersData');
  final user = FirebaseAuth.instance.currentUser.email;
  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    super.initState();

    album = DataFetching2(url1: url1).getCityWeather();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        children: [
          Expanded(
            child: FlatButton(
              height: 60,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionMaker(
                            sub:
                                "https://sheets.googleapis.com/v4/spreadsheets/1nKZxQH1nAVPPhpSLH1tPlYcW31-ZRM9qi7KoGvpLroc/values/$subject?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc")));
              },
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: FloatingText(
                  text: "Start",
                  repeat: true,
                  floatingSpeed: 6,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  floatingTextStyle: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Select Your Subject",
        ),
      ),
      body: FutureBuilder(
        future: profile.doc('$user').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              List<dynamic> activeSub = data['activeSubject'];
              //ToDO Use Your activeSub
              print(activeSub);
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: FutureBuilder(
                      future: album,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error ${snapshot.error}');
                        }
                        if (snapshot.hasData) {
                          streamController.sink.add(snapshot.data.length);
                          // gridview
                          final length = snapshot.data['values'].length;
                          print(snapshot.data['values'][1]);
                          print(length);
                          for (int i = 0; i < length; i++) {
                            mainColor.add(Colors.white);
                          }
                          final orientation =
                              MediaQuery.of(context).orientation;
                          return Padding(
                            padding: EdgeInsets.all(5.0),
                            child: GridView.builder(
                              itemCount: length,
                              physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          (orientation == Orientation.portrait)
                                              ? 2
                                              : 4),
                              itemBuilder: (BuildContext context, int index) {
                                return index + 1 < length
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          child: GridTile(
                                              child: AlbumCard(
                                            album1: snapshot.data['values']
                                                [index + 1],
                                            colour: mainColor[index],
                                                active_subject: activeSub,//error
                                          )),
                                          onPressed: () {
                                            setState(() {
                                              if (mainColor[index]==Colors.white) {
                                                for (int i = 0; i < length; i++) {
                                                  mainColor[i] = Colors.white;
                                                }
                                                mainColor[index] = Colors.green;
                                                subject =
                                                snapshot.data['values'][index + 1][2];
                                              }
                                              else{
                                                mainColor[index]=Colors.white;
                                              }
                                            });
                                          },
                                        ),
                                      )
                                    : Container();
                              },
                            ),
                          );

                          // gridview(snapshot);
                        }

                        return circularProgress();
                      },
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
