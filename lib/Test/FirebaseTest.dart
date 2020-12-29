import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseTest extends StatefulWidget {
  @override
  _FirebaseTestState createState() => _FirebaseTestState();
}

class _FirebaseTestState extends State<FirebaseTest> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('usersData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: users.doc('pradeeptintali@gmail.com').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              List<dynamic> aSub;
              aSub = data['activeSubject'];
              print(aSub.toString());
              return Column(
                children: aSub.map((s) {
                  return Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(s),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
