import 'package:covid_tracker/tools/location.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/locationScreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:covid_tracker/screens/listScreen.dart';
import 'package:covid_tracker/utilities/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:covid_tracker/screens/chartScreen.dart';

void main() {
  runApp( MaterialApp(
      builder: (BuildContext context, Widget child) {
        /// make sure that loading can be displayed in front of all other widgets
        return FlutterEasyLoading(child: child);
      },
      home: CovidTrackerApp(child: LocationScreen())
  ));}

  class CovidTrackerApp extends StatefulWidget {
    Widget child;
    CovidTrackerApp({this.child});
    @override
    _CovidTrackerAppState createState() => _CovidTrackerAppState();
  }

  class _CovidTrackerAppState extends State<CovidTrackerApp> {
    @override
    Widget build(BuildContext context) {

      return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: 48,
            backgroundColor: kBackgroundColor,
            items: <Widget>[
              Icon(Icons.pin_drop, size: 25),
              Icon(Icons.list, size: 25)
            ],
            onTap: (index) {
                setState(() {

                if(index == 0) {
                  print(index);
                  widget.child = new LocationScreen();
                }
                else if (index == 1) {
                  widget.child = new ListScreen();
                }

                });
            },
          ),
          backgroundColor: Color(0xFF389FA7),
          body: widget.child
      );LocationScreen();
    }
  }
