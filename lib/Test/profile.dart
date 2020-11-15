import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),

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

                        child: Icon(Icons.person,color: Colors.white,size: 130.0,),
                        radius: 100.0,
                      ),
                    ),

                    Text(
                      "Abhinav Sahai",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("Log-out",style: TextStyle(color: Colors.white),),
                          color: Colors.redAccent,
                          onPressed: () {},
                        ),
                        SizedBox(width: 10.0,),
                        RaisedButton(
                          child: Text("Edit Profile",style: TextStyle(color: Colors.white)),
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
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "Name",data: "Abhinav Sahai",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "Section",data: "A",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "Branch",data: "Mechanical ",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "College",data: "GL BAJAJ INSTITUTE OF TECHNOLOGY",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "Mobile No",data: "9667XXXXX",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "E Mail",data:"sahai.abhinav99@gmail.com",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "DOB",data: "24/12/1999",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "Address",data: "Gr Noida",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "State",data: "Uttar Pradesh",),
              Divider(
                  color: Colors.grey[800]),

              Row_wise_details(title: "Country",data: "INDIA",),
              Divider(
                  color: Colors.grey[800]),
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                child: Center(child: Text("Active Subjects",style: TextStyle(color: Colors.black,fontSize: 30.0),)),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

class Row_wise_details extends StatelessWidget {
  Row_wise_details({this.data,this.title});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Text(
          "${title}",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
        ),
        SizedBox(width: 20.0,),
        Flexible(child: Text("${data}",style: TextStyle(fontSize: 25.0),))
      ],
    );
  }
}
