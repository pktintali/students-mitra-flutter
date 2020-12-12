import 'package:flutter/material.dart';

class AlbumCard extends StatefulWidget {
  const AlbumCard({this.album1, this.colour, this.check});

  final List album1;
  final Color colour;
  final bool check;

  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.colour,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
          ),
        ),
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        // color: Colors.white,
        // alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FractionalTranslation(
                    translation: Offset(-0.1, -0.1),
                    child: IconButton(
                      icon: Icon(
                        Icons.star_border,
                        size: 20.0,
                        color: widget.colour == Colors.white
                            ? Colors.black
                            : Colors.white,
                      ),
                      color: Colors.black,
                      onPressed: () {},
                    )),
                FractionalTranslation(
                  translation: Offset(0, -0.7),
                  child: Container(
                    height: 20.0,
                    width: 35.0,
                    child: Center(
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.album1[2],
              style: TextStyle(
                fontSize: 25.0,
                color:
                    widget.colour == Colors.white ? Colors.black : Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.album1[1],
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: widget.colour == Colors.white
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
