
class Country {

  String country;
  int new_cases;
  int new_deaths;
  String date;
  int activeCases;

  Country({this.country,this.new_cases,this.activeCases,this.new_deaths,this.date});

  Country.fromJson(Map<String, dynamic> json) {

    country      = json['Country'];
    new_cases    = json['NewConfirmed'];
    new_deaths   = json['NewDeaths'];
    date         = json['Date'];
    activeCases = json['TotalConfirmed'] - json['TotalRecovered'];

  }


}