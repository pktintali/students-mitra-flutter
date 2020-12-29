import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_mitra_flutter/Auth/LoginSignUp.dart';
import 'package:students_mitra_flutter/Auth/myFirebase.dart';

class Profile extends StatefulWidget {
  static const String id = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CollectionReference profile =
      FirebaseFirestore.instance.collection('usersData');
  final user = FirebaseAuth.instance.currentUser.email;

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        // leading: Container(),
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
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.height * 0.4,
                        height: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 100.0,
                                ),
                                radius: 80.0,
                              ),
                            ),
                            Text(
                              data['profile']['name'],
                              style: TextStyle(fontSize: 25.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  child: Text(
                                    "Log-out",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.redAccent,
                                  onPressed: () async {
                                    await MyFirebase.doSignOut();
                                    Navigator.pushReplacementNamed(
                                        context, LoginSignUp.id);
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RaisedButton(
                                  child: Text("Edit Profile",
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.green,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "Name :",
                        data: data['profile']['name'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "Section :",
                        data: data['profile']['sec'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "Branch :",
                        data: data['profile']['branch'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "College :",
                        data: data['profile']['college'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "Mobile :",
                        data: data['profile']['mobile'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "E Mail :",
                        data: data['profile']['email'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "DOB :",
                        data: data['profile']['dob'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "Address :",
                        data: data['profile']['address'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "State :",
                        data: data['profile']['state'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                      RowWiseDetails(
                        title: "Country",
                        data: data['profile']['country'] ?? 'NAN',
                      ),
                      Divider(color: Colors.grey[800]),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class RowWiseDetails extends StatelessWidget {
  RowWiseDetails({this.data = 'NAN', this.title = 'NAN'});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "$title",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
        ),
        SizedBox(
          width: 20.0,
        ),
        Flexible(
            child: Text(
          "$data",
          style: TextStyle(fontSize: 20.0),
        ))
      ],
    );
  }
}
