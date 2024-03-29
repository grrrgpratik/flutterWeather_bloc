import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/bloc/settings_bloc.dart';

import 'package:flutterweather/model/models.dart' as model;
import 'package:flutterweather/widgets/temperature.dart';
import 'package:flutterweather/widgets/weather_condition.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final model.Weather weather;

  CombinedWeatherTemperature({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditions(condition: weather.condition),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                return Temperature(
                  temperature: weather.temp,
                  high: weather.maxTemp,
                  low: weather.minTemp,
                  units: state.temperatureUnits,
                );
              }),
            ),
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
