import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/tools/location.dart';
import 'package:covid_tracker/classes/country.dart';
import 'package:covid_tracker/classes/countryHistoricalData.dart';


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

  Future<List<Country>> getAllSummaryData() async {
    List<Country> data = List<Country>();
    try {
      var response = await http.get(baseURL + '/summary');
      if (response.statusCode == 200) {
        var rawData = jsonDecode(response.body)['Countries'];

        for (var item in rawData) {
          data.add(Country.fromJson(item));
        }
        return data;
      }
      else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
    Future<List<CountryHistoricalData>> getCountryData(String country) async {
      List<CountryHistoricalData> data = List<CountryHistoricalData>();
      var url = '$baseURL/total/dayone/country/$country';
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          var raw_data = jsonDecode(response.body);
          for(var item in raw_data) {
              data.add(CountryHistoricalData.fromJson(item));
          }
          return data;
        }
        else {
          print('Network error ${response.statusCode}');
        }
      } catch(e) {
        print(e);
      }

    }

  }
