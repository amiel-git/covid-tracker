import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/locationScreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(CovidTrackerApp());
}

class CovidTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (BuildContext context, Widget child) {
          /// make sure that loading can be displayed in front of all other widgets
          return FlutterEasyLoading(child: child);
        },
        home: LocationScreen(),
    );LocationScreen();
  }
}
