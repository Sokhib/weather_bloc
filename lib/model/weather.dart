import 'package:weather_bloc/model/current.dart';
import 'package:weather_bloc/model/forecast.dart';
import 'package:weather_bloc/model/location.dart';

class Weather {
  final Location location;
  final Current current;
  final Forecast forecast;

  Weather.fromJsonMap(Map<String, dynamic> map)
      : location = Location.fromJsonMap(map["location"]),
        current = Current.fromJsonMap(map["current"]),
        forecast = Forecast.fromJsonMap(map["forecast"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = location == null ? null : location.toJson();
    data['current'] = current == null ? null : current.toJson();
    data['forecast'] = forecast == null ? null : forecast.toJson();
    return data;
  }
}
