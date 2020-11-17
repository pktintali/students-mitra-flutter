import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({this.album1, this.colour});

  final List album1;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 14.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.star_border,size: 40.0,),color:Colors.black,onPressed: (){},),
                Container(
                  height: 48.0,
                  width:70.0,
                  child: Center(child: Text('New',style: TextStyle(fontSize: 20.0,color: Colors.white),),),

                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15.0))
                  ),
                ),
              ],
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Text(
                  album1[2],
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                album1[1],
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
