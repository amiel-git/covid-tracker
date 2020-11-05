import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/locationScreen.dart';

void main() {
  runApp(CovidTrackerApp());
}

class CovidTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocationScreen();
  }
}
