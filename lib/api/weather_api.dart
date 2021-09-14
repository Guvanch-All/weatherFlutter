import 'dart:developer';
import 'dart:convert';

import 'package:weather_apps/models/weather_forecast_daily.dart';
import 'package:weather_apps/utilites/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_apps/utilites/location.dart';

class weatherApi {
  Future<WeatherForeCast> fetchWeatherForecast(
      {String cityName,bool isCity}) async {
    // Location location = Location();
    // await location.getCurrentLocation();
    Map<String, String> paramaters;
    if(isCity ==true){
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      paramaters=queryParametrs;
    }

    else{
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        // 'lat': location.latitude.toString(),
       };
      paramaters=queryParametrs;
    }



    var myUri = Uri.http(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, paramaters);

    log('request: ${myUri.toString()}');

    var response = await http.get(myUri); //запрос передается в RESPONSE
    print('response: ${response?.body}');
    if (response.statusCode == 200) {
      return WeatherForeCast.fromJson(json.decode(response
          .body)); //в случае успешного запроса декодирует запрос json который находиться в response
    } else {
      throw Exception('Error response');
    }
  }
}
