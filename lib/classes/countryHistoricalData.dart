class CountryHistoricalData {

  String date;
  int activeCases;

  CountryHistoricalData({this.date, this.activeCases});

  CountryHistoricalData.fromJson(Map<String,dynamic> json) {

    date = json['Date'];
    activeCases = json['Active'];

  }


}