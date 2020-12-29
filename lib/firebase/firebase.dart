import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firebase {
  ///This is  only for [Testing]
  Future<dynamic> addUser(
      {@required String fullName, String company, int age}) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        // .set({
        //   'full_name': fullName, // John Doe
        //   'company': company, // Stokes and Sons
        //   'age': age // 42
        // })
        .add({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
