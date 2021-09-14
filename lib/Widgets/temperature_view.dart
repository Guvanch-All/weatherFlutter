

import 'package:flutter/material.dart';
import 'package:weather_apps/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForeCast> snapshot;

  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var description = forecastList[0].weather[0].description;
    var icon = forecastList[0].getIConUrl();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(icon,scale: 0.7,),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$temp °С',
                style: TextStyle(fontSize: 54.0, color: Colors.black)),
            Text('$description',style: TextStyle(fontSize: 18.0,color: Colors.black),),
          ],
        )
      ],
    ));
  }
}
