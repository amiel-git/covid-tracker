import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid_tracker/tools/location.dart';



class NetworkHelper {

  var baseURL = 'https://api.covid19api.com';

  Future<dynamic> getLatestCountryData(String country) async {

    var url = '$baseURL/country/$country';

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data[data.length - 1];
      }
      else {
        print('Network error ${response.statusCode}');
      }
    } catch(e) {
      print(e);
    }

  }




}