import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:students_mitra_flutter/Test/DataFetching2.dart';
import 'single_subject_test_review.dart';

class QuestionMaker extends StatefulWidget {
  final String sub;
  QuestionMaker({this.sub});
  @override
  _QuestionMakerState createState() => _QuestionMakerState(sub);
}

class _QuestionMakerState extends State<QuestionMaker> {
  final String sub1;
  _QuestionMakerState(this.sub1);
  List array = [];
  Future<dynamic> data;
  List theUser = [];
  int index = 1;
  int score = 0;
  int c = 0;
  Timer timer;
  int total = 10;
  int elapsed = 0;
  int attempted = 0;
  int not_attempted = 0;
  int negative = 0;
  Color colour = Colors.white;
  List<String> optArray = [];
  bool ch=false;
  initTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == total) {
        timer.cancel();
        ch=false;
        setState(() {
          if (index < 20) {
            index++;
          }
          elapsed = 0;
          if (index < 20) {
            initTimer();
          }
          else{
            index = 1;
            not_attempted = 20 - attempted;
            negative = attempted - score;
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Score_review_single_sub(
                          sub: array,
                          score: score,
                          attempted: attempted,
                          negative: negative,
                          not_attempted:
                          not_attempted,
                        )));
          }


        });
      } else {
        setState(() {
          elapsed = timer.tick;
        });
      }
    });
  }

  Future<dynamic> futurealbum;
  Check(val, ans) {

    if (val == ans) {
      return true;
    }

    return false;
  }

  List<Color> optColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  void initState() {
    super.initState();
    initTimer();
    futurealbum = DataFetching2(url1: sub1).getCityWeather();
  }

  void saveOptions(AsyncSnapshot snapshot) {
    optArray.add(snapshot.data['values'][index][2]);
    optArray.add(snapshot.data['values'][index][3]);
    optArray.add(snapshot.data['values'][index][4]);
    optArray.add(snapshot.data['values'][index][5]);
  }
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<dynamic>(
        future: futurealbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            saveOptions(snapshot);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text("$elapsed"),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Card(
                                elevation: 8.0,
                                child: Column(
                                  children: [
                                    Text("$index/20"),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        "${snapshot.data["values"][index][1]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: Text(
                                  "Choose the Correct Answer",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    optArray[0].length > 0
                                        ? optContainer(i: 0, snapshot: snapshot)
                                        : Container(),
                                    optArray[1].length > 0
                                        ? optContainer(i: 1, snapshot: snapshot)
                                        : Container(),
                                    optArray[2].length > 0
                                        ? optContainer(i: 2, snapshot: snapshot)
                                        : Container(),
                                    optArray[3].length > 0
                                        ? optContainer(i: 3, snapshot: snapshot)
                                        : Container(),
                                  ],
                                ),
                              ),
                              index<20?RaisedButton(
                                color:ch==true?Colors.red:Colors.green,
                                child: ch==true?Text('Next'):Text('Skip'),
                                onPressed: () {
                                  optArray = [];
                                  setState(() {
                                    ch=false;
                                    timer.cancel();
                                    elapsed = 0;
                                    initTimer();
                                    if (index < 20) {
                                      index++;
                                      c = 0;
                                    }
                                    // optColor = Colors.white;
                                    optColors = [
                                      Colors.white,
                                      Colors.white,
                                      Colors.white,
                                      Colors.white
                                    ];
                                  });
                                },
                              ):Text(""),
                              index == 20
                                  ? RaisedButton(
                                      color: Colors.green,
                                      child: Text("Submit"),
                                      onPressed: () {
                                        print(score);
                                        setState(() {
                                          index = 1;
                                          not_attempted = 20 - attempted;
                                          negative = attempted - score;
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Score_review_single_sub(
                                                        sub: array,
                                                        score: score,
                                                        attempted: attempted,
                                                        negative: negative,
                                                        not_attempted:
                                                            not_attempted,
                                                      )));
                                        });
                                      })
                                  : Text(""),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget optContainer({int i, AsyncSnapshot snapshot}) {

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        elevation: 4.0,
        padding: EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Center(
              child: Text(
                optArray[i],
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ),
        color: optColors[i],
        onPressed: () {
          ch=true;
          attempted++;
          if (c == 0) {
            array.add(MyVector(
                ques: snapshot.data["values"][index][1],
                selected_option: optArray[i],
                ans: snapshot.data["values"][index][6]));
          }
          if ((index < 20) &&
              (Check(optArray[i], snapshot.data['values'][index][6]) == true)) {
            score++;
            c = 0;
          } else {
            if (c == 0) {
              if (Check(optArray[i], snapshot.data['values'][index][6]) ==
                  true) {
                print(score);
                score++;
                c++;
              }
            }
          }

          setState(() {
            if (optArray[i] == snapshot.data['values'][index][6]) {
              optColors[i] = Colors.green;
            } else {
              optColors[i] = Colors.red;
              if (optArray[0] == snapshot.data['values'][index][6]) {
                optColors[0] = Colors.green;
              }
              if (optArray[1] == snapshot.data['values'][index][6]) {
                optColors[1] = Colors.green;
              }
              if (optArray[2] == snapshot.data['values'][index][6]) {
                optColors[2] = Colors.green;
              }
              if (optArray[3] == snapshot.data['values'][index][6]) {
                optColors[3] = Colors.green;
              }
            }
          });
        },
        colorBrightness: Brightness.light,
      ),
    );
  }
}

class MyVector {
  final String ques;
  final String selected_option;
  final String ans;
  const MyVector({this.ques, this.ans, this.selected_option});
}
