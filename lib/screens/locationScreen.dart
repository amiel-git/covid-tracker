import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 48,
          backgroundColor: Color(0xFF389FA7),
          items: <Widget>[
            Icon(Icons.pin_drop, size: 25),
            Icon(Icons.list, size: 25),
            Icon(Icons.search, size: 25),
          ],
        ),
        backgroundColor: Color(0xFF389FA7),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right:8.0,top: 8.0),
                    child: Icon(Icons.local_hospital,color: Colors.white,size: 45.0,),
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
                      Text('11-05-2020 17:58',textAlign: TextAlign.left,
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
                  new TextSpan(text: 'Philippines', style: kTableValuesContentTextStyle),
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
                             new TextSpan(text: '4308374', style: kTableValuesContentTextStyle),
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
                             new TextSpan(text: '160349', style: kTableValuesContentTextStyle),
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
                             new TextSpan(text: '34097452', style: kTableValuesContentTextStyle),
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
        ),
      ),
    );
  }
}