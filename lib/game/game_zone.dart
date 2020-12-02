import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/game/join_room.dart';
import 'join_room.dart';

class GameLogin extends StatefulWidget {
  @override
  _GameLoginState createState() => _GameLoginState();
}

class _GameLoginState extends State<GameLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Game Zone",
          style: TextStyle(fontSize: 25.0),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            child: ClipOval(
                child: Image.network(
              "https://wallpaperaccess.com/full/895258.jpg",
              fit: BoxFit.cover,
            )),
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('https://wallpaperaccess.com/full/895258.jpg'),
                fit: MediaQuery.of(context).orientation == Orientation.portrait
                    ? BoxFit.fitHeight
                    : BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Center(
                    child: Text(
                  "Welcome To Game Mode",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                )),
                SizedBox(height: 30.0),
                Text(
                  "Join/Create Room",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Card(
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        hintText: 'Room',
                      ),
                      autocorrect: true,
                      onChanged: (v) {},
                      // decoration: TextDecoration(),
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 30
                          : 0,
                ),
                FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Join_Room()));
                    print('done');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.white)),
                  child: Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 20
                          : 10,
                ),
                FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.white,
                  onPressed: () {
                    print('done');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.white)),
                  child: Text(
                    'Create Room',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
