import 'package:flutter/material.dart';
import 'package:weather_apps/Screens/location_screen.dart';
import 'package:weather_apps/models/weather_forecast_daily.dart';

import 'Screens/weather_forecast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherForeCastScreen()
    );
  }
}
