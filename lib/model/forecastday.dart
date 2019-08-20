import 'package:weather_bloc/model/astro.dart';
import 'package:weather_bloc/model/day.dart';

class Forecastday {
  final String date;
  final int date_epoch;
  final Day day;
  final Astro astro;

  Forecastday.fromJsonMap(Map<String, dynamic> map)
      : date = map["date"],
        date_epoch = map["date_epoch"],
        day = Day.fromJsonMap(map["day"]),
        astro = Astro.fromJsonMap(map["astro"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['date_epoch'] = date_epoch;
    data['day'] = day == null ? null : day.toJson();
    data['astro'] = astro == null ? null : astro.toJson();
    return data;
  }
}
