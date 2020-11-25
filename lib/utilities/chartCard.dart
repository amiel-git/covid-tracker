import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/classes/countryHistoricalData.dart';


class ChartCard extends StatelessWidget {
  final historicalData;
  ChartCard({this.historicalData});
  @override
  Widget build(BuildContext context) {
     return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: SfCartesianChart(
        backgroundColor: Colors.grey,
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Country Chart'),
          // Enable legend
          legend: Legend(isVisible: false),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(
              header: "Active Cases",
              enable: true),
          series: <ChartSeries<CountryHistoricalData, String>>[
            LineSeries<CountryHistoricalData, String>(
                dataSource: historicalData,
                xValueMapper: (CountryHistoricalData histData, _) => histData.date.substring(0,10),
                yValueMapper: (CountryHistoricalData histData, _) => histData.activeCases,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false))
          ]),
    );
  }
}


