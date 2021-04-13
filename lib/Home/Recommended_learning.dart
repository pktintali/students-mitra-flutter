import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:students_mitra_flutter/Test/DataFetching2.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Test extends StatefulWidget {
  Test({this.sub});
  final String sub;
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<dynamic> album;
  String data = "";

  final List<String> _ids = [
    'srqZ5jsvXEc',
  ];
  StreamController<int> streamController = new StreamController<int>();
  YoutubePlayerController _controller;
  _get() {
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

// Future<dynamic> getData(){}
  @override
  void initState() {
    super.initState();
    String user =
        "https://sheets.googleapis.com/v4/spreadsheets/1nKZxQH1nAVPPhpSLH1tPlYcW31-ZRM9qi7KoGvpLroc/values/${widget.sub}?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc";
    _get();

    album = DataFetching2(url1: user).getCityWeather();
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  //todo
// var subjectJson = await networking.getData();
  // Map<String, dynamic> map = json.decode(subjectJson);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: album,
        builder: (context, snapshot) {
          // not setstate here
          //
          Map<String, dynamic> myData = json.decode(snapshot.data);
          print("Data------->${myData['values']}");
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          //
          if (snapshot.hasData) {
            print("abhinav sahai");
            if (myData != null) streamController.sink.add(myData.length);
            // gridview
            //if(MediaQuery.of(context).orientation==Orientation.portrait){
            //return gridview_potrait(snapshot);
            //}else{
            //return gridview_landscape(snapshot);
            //}
            return myData["values"] != null
                ? ListView.builder(
                    itemCount: myData["values"].length -
                        (myData["values"].length - 10),
                    itemBuilder: (BuildContext context, int index) {
                      _ids[0] = myData["values"][index >= 1 ? index : 1][8];
                      _get();

                      return index >= 1 && index < 10
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Card(
                                  elevation: 4.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Flexible(
                                                child: Text(
                                              myData["values"][index][1],
                                              style: TextStyle(fontSize: 25.0),
                                            )),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          YoutubePlayer(
                                            controller: _controller,
                                            showVideoProgressIndicator: true,
                                            bottomActions: [
                                              CurrentPosition(),
                                              ProgressBar(isExpanded: true),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Text("");
                    })
                : circularProgress();
          }

          return circularProgress();
        },
      ),
    );
  }
}
