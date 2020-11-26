import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:covid_tracker/utilities/customTextSpan.dart';
class ReusableCard extends StatelessWidget {

  final country;
  final new_cases;
  final new_deaths;
  final date;
  final activeCases;
  final onTap;
  ReusableCard({this.country, this.new_deaths,this.new_cases,this.date,this.activeCases, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.all(1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextSpan(title: 'Country',value: country),
                    CustomTextSpan(title: 'New Cases: ', value: '$new_cases'),
                    CustomTextSpan(title: 'New Deaths: ', value: '$new_deaths'),
                    CustomTextSpan(title: 'Active Cases: ', value: '$activeCases'),
                    CustomTextSpan(title: 'Last Updated: ', value: date.toString().substring(0,10))
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
