import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:covid_tracker/tools/location.dart';
import 'package:covid_tracker/tools/networking.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:covid_tracker/screens/listScreen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String country = "";
  int cases = 0;
  int deaths = 0;
  int recovered = 0;
  String date_last_updated = "";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    getDataAndUpdateUI();
    NetworkHelper().getAllSummaryData();
    super.initState();

  }
  Future<void> getDataAndUpdateUI() async {
      
      var location = Location();
      EasyLoading.show(status: 'loading...');
      await location.getLocation();
      data = await NetworkHelper().getLatestCountryData(location.country);
      updateUI(data);
      EasyLoading.dismiss(animation: true);
  }

  void updateUI(data) {
    setState(() {
      country           =  data['Country'];
      cases             =  data['Confirmed'];
      deaths            =  data['Deaths'];
      recovered         =  data['Recovered'];
      date_last_updated =  data['Date'];
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right:8.0,top: 8.0),
                    child: GestureDetector(
                        onTap: () {
                          EasyLoading.show(status: 'loading...');

                            //TODO: Function to view essential things to do to avoid covid
                        },
                        child: Icon(Icons.local_hospital,color: Colors.white,size: 45.0,)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: <Widget>[
                  Text('Covid-19 Tracker',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Date Last Updated: ', textAlign: TextAlign.left,
                      style: kUpdateTextStyle,),
                      Text(date_last_updated,textAlign: TextAlign.left,
                      style: kUpdateContentTextStyle,)
                    ],
                  )
                ],
              ),

              Expanded(
                  flex: 3,
                  child: Lottie.asset('assets/virus.json')),

              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     Align(
                       alignment: Alignment.center,
                       child: RichText(
                  text: new TextSpan(
                  children: <TextSpan>[
                  new TextSpan(text: 'Country:  ', style: kTableTitleTextStyle),
                  new TextSpan(text: country, style: kTableValuesContentTextStyle),
                          ],
                        ),
                    ),
                     ),
                     Align(
                       alignment: Alignment.center,
                       child: RichText(
                         text: new TextSpan(
                           children: <TextSpan>[
                             new TextSpan(text: 'Total Cases:  ', style: kTableTitleTextStyle),
                             new TextSpan(text: '$cases', style: kTableValuesContentTextStyle),
                           ],
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.center,
                       child: RichText(
                         text: new TextSpan(
                           children: <TextSpan>[
                             new TextSpan(text: 'Deaths:  ', style: kTableTitleTextStyle),
                             new TextSpan(text: '$deaths', style: kTableValuesContentTextStyle),
                           ],
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.center,
                       child: RichText(
                         text: new TextSpan(
                           children: <TextSpan>[
                             new TextSpan(text: 'Recovered:  ', style: kTableTitleTextStyle),
                             new TextSpan(text: '$recovered', style: kTableValuesContentTextStyle),
                           ],
                         ),
                       ),
                     ),
                   ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              )
            ],
          ),
      );
  }
}