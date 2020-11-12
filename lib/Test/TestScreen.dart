import 'dart:async';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Test/AlbumCard.dart';
import 'package:students_mitra_flutter/Test/DataFetching2.dart';
import 'package:students_mitra_flutter/Test/QuestionMaker.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var url1 =
      "https://sheets.googleapis.com/v4/spreadsheets/1sQhy4Ex1XztFzMU3_nvpc-9par8AcIIwsksm9vhlM_E/values/subject?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc";
  StreamController<int> streamController = new StreamController<int>();
  Future<dynamic> album;
  List<dynamic> arr = [];
  List<Widget> myTile = [];

  void getTiles(data) {
    int c = 0;
    for (var i in data) {
      if (c == 0) {
        c++;
        continue;
      }

      myTile.add(GestureDetector(
        child: GridTile(child: AlbumCard(album1: i)),
        onTap: () {
          setState(() {
            if (arr.contains(i[2])) {
              arr.remove(i[2]);
            } else {
              arr.add(i[2]);
            }
            print(arr);
          });
        },
      ));
    }
  }

  gridview(AsyncSnapshot<dynamic> snapshot) {
    print(snapshot.data['values'][0]);
    getTiles(snapshot.data['values']);
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: myTile,
      ),
    );
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    super.initState();

    album = DataFetching2(url1: url1).getCityWeather();
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Select Your Subjects",
            style: TextStyle(fontSize: 40.0, color: Colors.grey),
          )),
          Center(
            child: RaisedButton(
              onPressed: () {
                for (var k in arr) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionMaker(sub: k)));
                }
              },
              color: Colors.red,
              child: Text("Test"),
            ),
          ),
          Flexible(
            child: FutureBuilder<dynamic>(
              future: album,
              builder: (context, snapshot) {
                // not setstate here
                //
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                //
                if (snapshot.hasData) {
                  streamController.sink.add(snapshot.data.length);
                  // gridview

                  return gridview(snapshot);
                }

                return circularProgress();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
