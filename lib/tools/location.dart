import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class Location {

  double latitude;
  double longitude;
  String country;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude  = position.latitude;
      longitude = position.longitude;

      //Translate coordinates
      var coordinates = new Coordinates(latitude, longitude);
      var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var _country_raw = address.first.countryName;
      country =  _country_raw.toLowerCase().replaceAll(RegExp(' '), '-');

    } catch (e) {
      print(e);
    }

  }

}