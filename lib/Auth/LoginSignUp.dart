import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Home/graphs.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginSignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool isSignUp = false;

  final name = Padding(
    padding: EdgeInsets.all(0.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          hintText: 'Name',
        ),
        autocorrect: true,
        onChanged: (v) {},
        // decoration: TextDecoration(),
      ),
    ),
  );

  final emailField = Padding(
    padding: EdgeInsets.all(0.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          hintText: 'E-Mail',
        ),
        autocorrect: true,
        onChanged: (v) {},
        // decoration: TextDecoration(),
      ),
    ),
  );
  final passwordField = Padding(
    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
          hintText: 'Password',
        ),
        autocorrect: true,
        onChanged: (v) {},
        // decoration: TextDecoration(),
      ),
    ),
  );

  final buttonTextStyle = TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Log-in",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.call_made),
          onPressed: () {
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Graphs()));
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: loginAndSignupPage(),
      ),
    );
  }

  Widget loginAndSignupPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 30),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  FractionalTranslation(
                    translation: Offset(0, -0.65),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Center(
                        child: Icon(
                          Icons.group,
                          size: 100.0,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Enter Your Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        name,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Enter Your Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        emailField,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Enter Your Password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        passwordField,
                        isSignUp
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Confirm Your Password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: 1,
                              ),
                        isSignUp
                            ? passwordField
                            : SizedBox(
                                height: 1,
                              ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    isSignUp = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Login',
                                    style: buttonTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    isSignUp = true;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'SignUp',
                                    style: buttonTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
