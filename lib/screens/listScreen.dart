import 'package:covid_tracker/utilities/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/constants.dart';
import 'package:covid_tracker/utilities/reusableCard.dart';
import 'package:covid_tracker/tools/networking.dart';


class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    NetworkHelper().getAllSummaryData();
    return SafeArea(
      child: Column(
          children: <Widget>[
          Expanded(
            
            child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ReusableCard();


                    },

             ),
          ),
            SizedBox(
              height: 30.0,
            )
        ],
      ),
    );

  }
}
