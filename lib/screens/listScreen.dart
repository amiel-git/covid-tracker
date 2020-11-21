import 'package:covid_tracker/classes/country.dart';
import 'package:covid_tracker/utilities/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utilities/constants.dart';
import 'package:covid_tracker/utilities/reusableCard.dart';
import 'package:covid_tracker/tools/networking.dart';
import 'package:covid_tracker/classes/country.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class ListScreen extends StatefulWidget {

  var covidData = [];

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  void initState()  {
    updateCovidData();
    super.initState();
  }

  Future<void> updateCovidData() async {
    EasyLoading.show(status: 'loading...');
    await NetworkHelper().getAllSummaryData().then((value) {
      widget.covidData.addAll(value);
    });
    setState(() {
      EasyLoading.dismiss(animation: true);
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: <Widget>[
          Expanded(
            
            child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount: widget.covidData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ReusableCard(country: widget.covidData[index].country,);


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
