import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:students_mitra_flutter/Test/TestPage.dart';
import 'single_subject_test_review.dart';
import 'package:students_mitra_flutter/Profile/profile.dart';
class Score_review_single_sub extends StatefulWidget {
  final List sub;
  final int attempted;
  final int score;
  final int not_attempted;
  final int negative;

  Score_review_single_sub({this.sub,this.attempted,this.score,this.negative,this.not_attempted});
  @override
  _Score_review_single_subState createState() => _Score_review_single_subState(sub,attempted,score,not_attempted,negative);
}

class _Score_review_single_subState extends State<Score_review_single_sub> {
  final List sub;
  final  int attempted;
  final  int score;
  final int not_attempted;
  final int negative;

  _Score_review_single_subState(this.sub,this.attempted,this.score,this.negative,this.not_attempted);

  List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(intial: attempted,finals: 20,color: charts.MaterialPalette.yellow.shadeDefault),
      new LinearSales(intial: not_attempted,finals: 20,color: charts.MaterialPalette.blue.shadeDefault),
      new LinearSales(intial: score,finals: attempted,color: charts.MaterialPalette.green.shadeDefault),
      new LinearSales(intial: negative,finals: attempted,color: charts.MaterialPalette.red.shadeDefault),




    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.intial,
        measureFn: (LinearSales sales, _) => sales.finals,
        colorFn: (LinearSales sales, _) => sales.color,
        data: data,

        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.intial}: ${row.finals}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    print(attempted);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('ML Test',style: TextStyle(fontSize: 20.0),),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
              });
            },
          )
        ],

      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),

        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Close',style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                      onPressed: (){
                        setState(() {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>TestPage()));
                        });
                      }
                    ),
                    Card(
                      elevation: 8.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        child:Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Text('ScoreBoard',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                              SizedBox(width: 20.0,),
                              Text('${score}/20',style:TextStyle(fontSize: 35.0),),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 10.0,
                          width: 45.0,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8.0,),
                        Text('Correct'),
                        SizedBox(width: 8.0,),
                        Container(
                          height: 10.0,
                          width: 45.0,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8.0,),
                        Text('Incorrect'),
                        SizedBox(width: 8.0,),
                        Container(
                          height: 10.0,
                          width: 45.0,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 8.0,),
                        Text('Attempted'),
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 8.0,),
                        Container(
                          height: 10.0,
                          width: 45.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8.0,),
                        Text('Not Attempted'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                child: new charts.PieChart(_createSampleData(),
                    animate: true,



                    // Add an [ArcLabelDecorator] configured to render labels outside of the
                    // arc with a leader line.
                    //
                    // Text style for inside / outside can be controlled independently by
                    // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
                    //
                    // Example configuring different styles for inside/outside:
                    //       new charts.ArcLabelDecorator(
                    //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
                    //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
                    defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.outside,
                      )
                    ])),



              ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sub.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        color: sub[index].ans==sub[index].selected_option?Colors.green[200]:Colors.red[50],
                        elevation: 4.0,


                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,


                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(


                                  child: Flexible(child: Text('${index+1} - ${sub[index].ques}',style: TextStyle(fontSize: 25.0),)),
                                ),
                                SizedBox(height: 15.0,),
                                Text('You Selected',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5.0,),
                                Flexible(child: Text(sub[index].selected_option,style: TextStyle(fontSize: 25.0),)),

                                SizedBox(height: 10.0,),
                                Text('Correct Ans',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5.0,),
                                Flexible(child: Text(sub[index].ans,style: TextStyle(fontSize: 25.0),)),
                                SizedBox(height: 10.0,),
                                Center(
                                  child: TextButton(
                                    child: Text("Learn more about this ->",style: TextStyle(color: Colors.blue),),
                                    onPressed: (){},
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              RaisedButton(
                  child: Text('Close',style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  onPressed: (){
                    setState(() {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>TestPage()));
                    });
                  }
              ),


            ],
          ),

        ),
      ),
    );
  }
}
class LinearSales {
  final int intial;
  final int finals;
  final charts.Color color;


  LinearSales({this.intial, this.finals,this.color});
}