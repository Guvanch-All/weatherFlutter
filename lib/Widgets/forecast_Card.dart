import 'package:flutter/material.dart';
import 'package:weather_apps/utilites/forecast_util.dart';
import 'package:weather_apps/models/weather_forecast_daily.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index){
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000);
  var fullDate=Util.getFormatDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
   var icon = forecastList[index].getIConUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25,color: Colors.white),

          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                  child:Text(
                    '$tempMin °C',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),),
                 Image.network(icon, scale: 1.2,)
                ],
              )
            ],
          )
        ],
      ),
    ],
  );
}