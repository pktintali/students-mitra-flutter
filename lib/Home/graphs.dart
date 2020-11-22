import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:students_mitra_flutter/Profile/profile.dart';
import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';

class Graphs extends StatefulWidget {
  static const String id = 'graphs';
  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  List<charts.Series> subValue;
  List<charts.Series> lineValue;

  static List<charts.Series<GraphVal, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      GraphVal('DBMS', random.nextInt(100)),
      GraphVal('COI', random.nextInt(100)),
      GraphVal('DS', random.nextInt(100)),
      GraphVal('ML', random.nextInt(100)),
      GraphVal('AI', random.nextInt(100)),
    ];

    return [
      charts.Series<GraphVal, String>(
        id: 'Sales',
        domainFn: (GraphVal sales, _) => sales.year,
        measureFn: (GraphVal sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (GraphVal sales, _) {
          return charts.MaterialPalette.red.shadeDefault;
        },
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    subValue = _createRandomData();
  }

  barChart() {
    return charts.BarChart(
      subValue,
      animate: true,
      vertical: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
        centerTitle: true,
        title: Text("Progress"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 35.0,
            ),
            Center(
              child: Text(
                "Active Subjects Analysis",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            Center(
              child: Text(
                "% Average Marks",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Card(
              elevation: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.all(20.0),
                child: barChart(),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Center(
              child: Text(
                "Individual Subjects Progress",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Center(
              child: Text(
                "DBMS Marks",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Text(
                "% Average Marks",
                style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 0.0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
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
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphVal {
  final String year;
  final int sales;

  GraphVal(this.year, this.sales);
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
