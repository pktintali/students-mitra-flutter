import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
class Graphs extends StatefulWidget {
  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  List<charts.Series> sub_value;

  static List<charts.Series<Graph_val, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      Graph_val('DBMS', random.nextInt(100)),
      Graph_val('DAA', random.nextInt(100)),
      Graph_val('CD', random.nextInt(100)),
      Graph_val('DA', random.nextInt(100)),
      Graph_val('ML', random.nextInt(100)),
    ];

    return [
      charts.Series<Graph_val, String>(
        id: 'subjects',
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Card(
          elevation: 8.0,

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.5,
            padding: EdgeInsets.all(20.0),
            child: barChart(),
          ),
        ),
       ],
      ),
    );
  }
}
class Graph_val {
  final String year;
  final int sales;

  Graph_val(this.year, this.sales);
}