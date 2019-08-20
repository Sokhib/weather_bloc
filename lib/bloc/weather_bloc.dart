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
      final weatherJson = json.decode(weatherData.bodyString);
      print("date is: ${weatherJson['forecast']['forecastday'][0]['date']}");

      Weather weather = Weather.fromJsonMap(weatherJson);
      print(weather.location.country);

      yield WeatherLoaded(weather);
    }
    if(event is RefreshWeather) {
      yield WeatherLoading();
      final weatherData =
      await PostApiService.create().getWeather(event.city);
      final weatherJson = json.decode(weatherData.bodyString);
      print("date is: ${weatherJson['forecast']['forecastday'][0]['date']}");

      Weather weather = Weather.fromJsonMap(weatherJson);
      print(weather.location.country);

      yield WeatherLoaded(weather);
    }
  }
}
