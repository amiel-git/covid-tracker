
class Country {

  String country;
  int new_cases;
  int new_deaths;
  String date;
  int active_cases;

  Country({this.country,this.new_cases,this.active_cases,this.new_deaths,this.date});

  Country.fromJson(Map<String, dynamic> json) {

    country      = json['Country'];
    new_cases    = json['NewConfirmed'];
    new_deaths   = json['NewDeaths'];
    date         = json['Date'];
    active_cases = json['TotalConfirmed'] - json['TotalRecovered'];

  }


}