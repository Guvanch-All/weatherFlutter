import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_apps/Screens/city_screen.dart';
import 'package:weather_apps/Widgets/bottom_list_view.dart';
import 'package:weather_apps/Widgets/city_view.dart';
import 'package:weather_apps/Widgets/detail_view.dart';
import 'package:weather_apps/Widgets/temperature_view.dart';
import 'package:weather_apps/api/weather_api.dart';
import 'package:weather_apps/models/weather_forecast_daily.dart';

class WeatherForeCastScreen extends StatefulWidget {
  final locationWeather;

  WeatherForeCastScreen({this.locationWeather});

  @override
  WeatherForeCastScreenState createState() => WeatherForeCastScreenState();
}

class WeatherForeCastScreenState extends State<WeatherForeCastScreen> {
  Future<WeatherForeCast> forecastObject;

  // String _cityName = 'London';
  String _cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = weatherApi().fetchWeatherForecast();
    }

    // forecastObject.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              // forecastObject=weatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                if (tappedName != null) {
                  _cityName = tappedName;
                  forecastObject = weatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                }
              })
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForeCast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 70),
                      ButtonListView(
                        snapshot: snapshot,
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child:
                        SpinKitDoubleBounce(color: Colors.green, size: 100.0),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
