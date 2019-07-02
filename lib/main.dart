import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/weather_bloc.dart';
import 'bloc/weather_event.dart';
import 'bloc/weather_state.dart';
import 'data/post_api_service.dart';
import 'model/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Fake Weather'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weatherBloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocProvider(
          bloc: weatherBloc,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: BlocListener(
              bloc: weatherBloc,
              listener: (context, WeatherState state) {
                if (state is WeatherLoaded) {
                  print("${state.response} we are in listener");
                }
              },
              child: BlocBuilder(
                bloc: weatherBloc,
                builder: (BuildContext context, WeatherState state) {
                  if (state is WeatherInitial) {
                    print(state);
                    return buildInitialInput();
                  } else if (state is WeatherLoading) {
                    print(state);
                    return buildLoading();
                  } else if (state is WeatherLoaded) {
                    print(state);
                    return buildColumnWithData(state.response);
                  }
                },
              ),
            ),
          ),
        ));
  }

  Column buildColumnWithData(Weather response) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "${response.cityName}",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${response.temperature} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }

  @override
  void dispose() {
    weatherBloc.dispose();
    super.dispose();
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CityInputField extends StatefulWidget {
  const CityInputField({
    Key key,
  }) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(String cityName) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.dispatch(GetWeather(cityName));
  }
}
