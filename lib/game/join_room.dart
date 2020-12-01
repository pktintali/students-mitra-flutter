import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Join_Room extends StatefulWidget {
  @override
  _Join_RoomState createState() => _Join_RoomState();
}

class _Join_RoomState extends State<Join_Room> {
  List array=[
    "Abhinav Sahai",
    "Abhinav Sahai",
  ];
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Welcome Abhinav Sahai",style: TextStyle(fontSize: 20.0),),
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
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                SizedBox(height: 20.0),
                Text("Room id = ashbd8md89000",style: TextStyle(fontSize: 20.0,color: Colors.black),),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: 40,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),

                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      border: Border.all(color: Colors.blueAccent)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(child: Text("Joined Users",style: TextStyle(fontSize: 20.0),)),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(

                        border: Border.all(color: Colors.blueGrey)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: array.length,
                          itemBuilder: (context, index) {
                            return
                              Center(child: Text(array[index],style: TextStyle(fontSize: 20.0,color: Colors.red),));
                            // how to create a ListView show a Column that includes:
                            // _country[index].name,
                            // _country[index].capital,
                            // _country[index].language,


                          }),
                    )),
                SizedBox(height: 80.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    RaisedButton(
                      child: Text("Leave",style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                      onPressed: (){},
                    ),

                    RaisedButton(
                      child: Text("Join",style: TextStyle(color: Colors.white)),
                      color: Colors.green,
                      onPressed: (){},
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                    child: Text(
                      "Select Game Level",
                      style: TextStyle(fontSize: 30.0, color: Colors.black),
                    )),
                SizedBox(height: 30.0),
                Row(

                  children: [
                    Center(

                        child: InkWell(

                          onTap: () {
                            setState(() {
                              _value1 = !_value1;
                              _value2=false;
                              _value3=false;
                            });
                          },
                          child: Container(

                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: _value1
                                  ? Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.blue,

                              )
                                  : Icon(

                                Icons.circle,
                                size: 30.0,

                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(width: 20.0,),
                    Text("Easy",style: TextStyle(fontSize: 20.0),),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(

                  children: [
                    Center(

                        child: InkWell(

                          onTap: () {
                            setState(() {
                              _value2 = !_value2;
                              _value1=false;
                              _value3=false;
                            });
                          },
                          child: Container(

                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: _value2
                                  ? Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.blue,

                              )
                                  : Icon(

                                Icons.circle,
                                size: 30.0,

                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(width: 20.0,),
                    Text("Medium",style: TextStyle(fontSize: 20.0),),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(

                  children: [
                    Center(

                        child: InkWell(

                          onTap: () {
                            setState(() {
                              _value3 = !_value3;
                              _value1=false;
                              _value2=false;

                            });
                          },
                          child: Container(

                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: _value3
                                  ? Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.blue,

                              )
                                  : Icon(

                                Icons.circle,
                                size: 30.0,

                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(width: 20.0,),
                    Text("Hard",style: TextStyle(fontSize: 20.0),),
                  ],
                ),





              ],


            ),
          ),
        ),
      ),

    );
  }
}