import 'package:flutter/material.dart';
import 'constants.dart';

class CustomTextSpan extends StatelessWidget {

  final title;
  final value;

  CustomTextSpan({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: new TextSpan(
          children: <TextSpan>[
            new TextSpan(text:'$title: ', style: kCardTitleTextStyle),
            new TextSpan(text:value, style: kCardValuesContentTextStyle)
          ]
      ),
    );
  }
}
