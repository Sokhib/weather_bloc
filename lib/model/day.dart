import 'package:weather_bloc/model/condition.dart';

class Day {
  final double maxtemp_c;
  final double maxtemp_f;
  final double mintemp_c;
  final double mintemp_f;
  final double avgtemp_c;
  final double avgtemp_f;
  final double maxwind_mph;
  final double maxwind_kph;
  final double totalprecip_mm;
  final double totalprecip_in;
  final double avgvis_km;
  final double avgvis_miles;
  final double avghumidity;
  final Condition condition;
  final double uv;

  Day.fromJsonMap(Map<String, dynamic> map)
      : maxtemp_c = map["maxtemp_c"],
        maxtemp_f = map["maxtemp_f"],
        mintemp_c = map["mintemp_c"],
        mintemp_f = map["mintemp_f"],
        avgtemp_c = map["avgtemp_c"],
        avgtemp_f = map["avgtemp_f"],
        maxwind_mph = map["maxwind_mph"],
        maxwind_kph = map["maxwind_kph"],
        totalprecip_mm = map["totalprecip_mm"],
        totalprecip_in = map["totalprecip_in"],
        avgvis_km = map["avgvis_km"],
        avgvis_miles = map["avgvis_miles"],
        avghumidity = map["avghumidity"],
        condition = Condition.fromJsonMap(map["condition"]),
        uv = map["uv"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = maxtemp_c;
    data['maxtemp_f'] = maxtemp_f;
    data['mintemp_c'] = mintemp_c;
    data['mintemp_f'] = mintemp_f;
    data['avgtemp_c'] = avgtemp_c;
    data['avgtemp_f'] = avgtemp_f;
    data['maxwind_mph'] = maxwind_mph;
    data['maxwind_kph'] = maxwind_kph;
    data['totalprecip_mm'] = totalprecip_mm;
    data['totalprecip_in'] = totalprecip_in;
    data['avgvis_km'] = avgvis_km;
    data['avgvis_miles'] = avgvis_miles;
    data['avghumidity'] = avghumidity;
    data['condition'] = condition == null ? null : condition.toJson();
    data['uv'] = uv;
    return data;
  }
}
