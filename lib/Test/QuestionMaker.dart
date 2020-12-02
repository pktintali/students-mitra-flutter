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
  initTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == total) {
        timer.cancel();
        setState(() {
          index++;
          elapsed = 0;
          initTimer();
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
    timer.cancel();
    elapsed = 0;
    initTimer();
    if (val == ans) {
      return true;
    }

    return false;
  }

  void initState() {
    super.initState();
    initTimer();
    futurealbum = DataFetching2(url1: sub1).getCityWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<dynamic>(
        future: futurealbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                                            fontSize: 30),
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
                                  "${snapshot.data['values'][index][2]}",
                                  "${snapshot.data['values'][index][3]}",
                                  "${snapshot.data['values'][index][4]}",
                                  "${snapshot.data['values'][index][5]}"
                                ].map((option) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: RaisedButton(
                                      elevation: 4.0,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Center(
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black),
                                        ),
                                      ),
                                      onPressed: () {
                                        attempted++;
                                        if (c == 0) {
                                          array.add(MyVector(
                                              ques: snapshot.data["values"]
                                                  [index][1],
                                              selected_option: option,
                                              ans: snapshot.data["values"]
                                                  [index][6]));
                                        }
                                        if ((index < 20) &&
                                            (Check(
                                                    option,
                                                    snapshot.data['values']
                                                        [index][6]) ==
                                                true)) {
                                          score++;
                                          c = 0;
                                        } else {
                                          if (c == 0) {
                                            if (Check(
                                                    option,
                                                    snapshot.data['values']
                                                        [index][6]) ==
                                                true) {
                                              print(score);
                                              score++;
                                              c++;
                                            }
                                          }
                                        }
                                        setState(() {
                                          if (index < 20) {
                                            index++;
                                          }
                                        });
                                      },
                                      color: Colors.white,
                                      colorBrightness: Brightness.light,
                                    ),
                                  );
                                }).toList()),
                              ),
                              RaisedButton(
                                color: Colors.redAccent,
                                child: Text('Next'),
                                onPressed: () {
                                  setState(() {
                                    timer.cancel();
                                    elapsed = 0;
                                    initTimer();
                                    if (index < 20) {
                                      index++;
                                      c = 0;
                                    }
                                  });
                                },
                              ),
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
    super.dispose();
  }
}

class MyVector {
  final String ques;
  final String selected_option;
  final String ans;
  const MyVector({this.ques, this.ans, this.selected_option});
}
