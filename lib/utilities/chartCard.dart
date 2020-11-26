import 'package:covid_tracker/utilities/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/classes/countryHistoricalData.dart';
import 'package:intl/intl.dart';

class ChartCard extends StatelessWidget {
  final List historicalData;
  final String title;
  final String span;
  var startDateIndex = 0;
  ChartCard({this.historicalData, this.title,this.span});


  @override
  Widget build(BuildContext context) {
     return SfCartesianChart(
       zoomPanBehavior: ZoomPanBehavior(
         enablePanning: true,
         enablePinching: true
       ),
         margin: EdgeInsets.only(left: 10.0, right: 10.0),
       backgroundColor: Colors.grey[500],
         primaryXAxis: CategoryAxis(),
         // Chart title
         title: ChartTitle(text: '$title Active Cases Chart ($span)'),
         // Enable legend
         legend: Legend(isVisible: false),
         // Enable tooltip
         tooltipBehavior: TooltipBehavior(
             header: "Active Cases",
             enable: true),
         series: <ChartSeries<CountryHistoricalData, String>>[
           ColumnSeries<CountryHistoricalData, String>(
             color: kBackgroundColor,
               dataSource: historicalData,
               xValueMapper: (CountryHistoricalData histData, _) => histData.date.substring(2,10),
               yValueMapper: (CountryHistoricalData histData, _) => histData.activeCases,
               // Enable data label
               dataLabelSettings: DataLabelSettings(isVisible: false))
         ]);
  }
}


