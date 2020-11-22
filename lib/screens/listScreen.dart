import 'package:covid_tracker/classes/country.dart';
import 'package:covid_tracker/utilities/reusableCard.dart';
import 'package:flutter/cupertino.dart';
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
  var _covidDataForDisplay = List<dynamic>();
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
    _covidDataForDisplay = widget.covidData;
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
                    itemCount: _covidDataForDisplay.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0 ? _searchBar() : _listItems(index - 1);
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
  _listItems(index) {
    return ReusableCard(
        country: _covidDataForDisplay[index].country,
        new_cases: _covidDataForDisplay[index].new_cases,
        new_deaths: _covidDataForDisplay[index].new_deaths,
        activeCases: _covidDataForDisplay[index].activeCases,
        date: _covidDataForDisplay[index].date);
  }

  _searchBar() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top:10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'country...',
              fillColor: Colors.white60,
              focusColor: Colors.white,
              filled: true
            ),
            onChanged: (value) {
              _covidDataForDisplay = widget.covidData; // This is added to bring back original values everytime we delete inputs as well
              var inputCountry = value.toLowerCase();
              setState(() {
                _covidDataForDisplay = _covidDataForDisplay.where((item){
                  var itemCountry = item.country.toLowerCase();
                  return itemCountry.startsWith(inputCountry);
                }).toList();
              });
            },
          ),
        ),
      );
  }
}
