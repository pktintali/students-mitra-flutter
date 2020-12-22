import 'dart:async';
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Select Your Subject",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
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
          ),
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
                  final orientation = MediaQuery.of(context).orientation;
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: GridView.builder(
                      itemCount: length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 4),
                      itemBuilder: (BuildContext context, int index) {
                        return index + 1 < length
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: GridTile(
                                      child: AlbumCard(
                                    album1: snapshot.data['values'][index + 1],
                                    colour: mainColor[index], //error
                                  )),
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0; i < length; i++) {
                                        mainColor[i] = Colors.white;
                                      }
                                      mainColor[index] = Colors.green;
                                      subject =
                                          snapshot.data['values'][index + 1][2];
                                    });
                                  },
                                ),
                              )
                            : Container();
                        ;
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
      ),
    );
  }
}
