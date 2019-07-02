import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:weather_bloc/bloc/bloc.dart';
import 'package:weather_bloc/data/post_api_service.dart';
import 'package:weather_bloc/model/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final weatherData =
          await PostApiService.create().getWeather(event.cityName);
      print(weatherData.bodyString);
      Map<String, dynamic> list = json.decode(weatherData.bodyString);
      print(list['location']['name']);
      //toString() add
      yield WeatherLoaded(Weather(cityName: list['location']['name'], temperature: list['current']['temp_c']));
    }
  }
}
