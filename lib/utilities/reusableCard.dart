import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {

  final country;
  ReusableCard({this.country});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: new TextSpan(
                  children: <TextSpan>[
                    new TextSpan(text:'Country: ', style: kCardTitleTextStyle),
                    new TextSpan(text:country, style: kCardValuesContentTextStyle)
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
