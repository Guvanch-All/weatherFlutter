import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_apps/Screens/weather_forecast_screen.dart';
import 'package:weather_apps/api/weather_api.dart';
import 'package:weather_apps/models/weather_forecast_daily.dart';
class LocationScreen extends StatefulWidget {


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async{
    var weatherInfo= await weatherApi().fetchWeatherForecast();
    if(weatherInfo == null){
      print('weather info was null: $weatherInfo');
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherForeCastScreen(locationWeather: weatherInfo);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.green,
        ),
     ),

    );
  }
}
