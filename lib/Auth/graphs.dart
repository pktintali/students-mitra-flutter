import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:students_mitra_flutter/Explore/Explore.dart';
import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';
class Graphs extends StatefulWidget {
  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  List<charts.Series> sub_value;
  List<charts.Series> line_value;



  static List<charts.Series<Graph_val, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      Graph_val('DBMS', random.nextInt(100)),
      Graph_val('COI', random.nextInt(100)),
      Graph_val('DS', random.nextInt(100)),
      Graph_val('ML', random.nextInt(100)),
      Graph_val('AI', random.nextInt(100)),
    ];

    return [
      charts.Series<Graph_val, String>(
        id: 'Sales',
        domainFn: (Graph_val sales, _) => sales.year,
        measureFn: (Graph_val sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Graph_val sales, _) {
          return charts.MaterialPalette.red.shadeDefault;
        },
      )
    ];

  }


  @override
  void initState() {
    super.initState();
    sub_value = _createRandomData();

  }

  barChart() {
    return charts.BarChart(
      sub_value,
      animate: true,
      vertical: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text("Progress"),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 35.0,),
          Center(child: Text("Active Subjects Analysis",style:TextStyle(fontSize: 30.0),),),
          SizedBox(height: 45.0,),
          Center(child: Text("% Average Marks",style:TextStyle(fontSize: 15.0),),),
            SizedBox(height: 25.0,),
          Card(
            elevation: 0.0,

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
              padding: EdgeInsets.all(20.0),
              child: barChart(),
            ),
          ),
            SizedBox(height: 35.0,),
            Center(child: Text("Individual Subjects Progress",style:TextStyle(fontSize: 30.0),),),
            SizedBox(height: 35.0,),
            Center(child: Text("DBMS Marks",style:TextStyle(fontSize: 25.0),),),
            SizedBox(height: 25.0,),
            Center(child: Text("% Average Marks",style: TextStyle(fontSize: 15.0,color: Colors.grey[800]),),),
            SizedBox(height: 10.0,),
            Card(
              elevation: 0.0,

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.5,
                padding: EdgeInsets.all(20.0),
                child: SfCartesianChart(
                  // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      // Initialize line series
                      LineSeries<SalesData, String>(
                          dataSource: [
                            // Bind data source
                            SalesData('1', 35),
                            SalesData('2', 28),
                            SalesData('3', 34),
                            SalesData('4', 32),
                            SalesData('5', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales
                      )
                    ]
                )
              ),
            ),
         ],
        ),
      ),
    );
  }
}
class Graph_val {
  final String year;
  final int sales;

  Graph_val(this.year, this.sales);
}
class SalesData{
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}