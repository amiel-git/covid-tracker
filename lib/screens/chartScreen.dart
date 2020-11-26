import 'package:covid_tracker/classes/countryHistoricalData.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/chartCard.dart';
import 'package:covid_tracker/tools/networking.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:covid_tracker/utilities/constants.dart';

class ChartScreen extends StatefulWidget {
  String country;
  ChartScreen({this.country});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  String span;
  List<CountryHistoricalData> covidData = List<CountryHistoricalData>();
  var  _covidDataForDisplay;
  @override
  void initState() {
    _getHistoricalData();
    super.initState();

  }

  void _getHistoricalData() async {
      EasyLoading.show(status: 'loading data for ${widget.country}');
      await NetworkHelper().getCountryData(widget.country).then((value) => {
      covidData.addAll(value)
      });

      EasyLoading.dismiss(animation: true);
      updateUI();

  }

  void updateUI() {
    setState(() {
      span = "30 days";
      _covidDataForDisplay = covidData.sublist(covidData.length - 30, covidData.length);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: kBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  elevation: 10.0,
                  child: Center(
                    child: Text("All Time"),
                  ),
                  onPressed: (){
                    setState(() {
                      span = "All Time";
                        _covidDataForDisplay = covidData.sublist(0, covidData.length);
                    });
                  },
                ),
                RaisedButton(
                  elevation: 10.0,
                  child: Center(
                    child: Text("Last 30 days"),
                  ),
                  onPressed: (){
                    setState(() {
                      span = "30 days";
                      _covidDataForDisplay = covidData.sublist(covidData.length - 30, covidData.length);
                    });
                  },
                ),
                RaisedButton(
                  elevation: 10.0,
                  child: Center(
                    child: Text("Last 7 days"),
                  ),
                  onPressed: (){
                    setState(() {
                      span = "7 days";
                      _covidDataForDisplay = covidData.sublist(covidData.length - 7, covidData.length);
                    });
                  },
                ),

              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 8.0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ChartCard(historicalData: _covidDataForDisplay,title: widget.country,span: span)),
            )
          ],
        ),
      ),
    );
  }
}





