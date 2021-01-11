import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Test/AlbumCard.dart';
import 'package:students_mitra_flutter/Test/DataFetching2.dart';
import 'package:students_mitra_flutter/Test/QuestionMaker.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Youtube extends StatefulWidget {
  Youtube({this.user});
  final user;
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {

  YoutubePlayerController _controller ;
  void initState() {
    super.initState();
    _controller= YoutubePlayerController(
      initialVideoId: widget.user,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,

        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:YoutubePlayer(
        controller: _controller,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),

        ],
      ),
    );
  }
}
