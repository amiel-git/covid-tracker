import 'package:covid_tracker/classes/countryHistoricalData.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/chartCard.dart';
import 'package:covid_tracker/tools/networking.dart';


class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<CountryHistoricalData> covidData = List<CountryHistoricalData>();
  var _covidDataForDisplay;
  @override
  void initState() {
    _getHistoricalData();
    super.initState();

  }

  void _getHistoricalData() async {

      await NetworkHelper().getCountryData("Philippines").then((value) => {
      covidData.addAll(value)
      });

      updateUI();

  }

  void updateUI() {
    setState(() {
      _covidDataForDisplay = covidData;
    });
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: ChartCard(historicalData: covidData,))
        ],
      ),
    );
  }
}





