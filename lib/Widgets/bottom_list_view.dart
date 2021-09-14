import 'package:flutter/material.dart';
import 'package:weather_apps/models/weather_forecast_daily.dart';

import 'forecast_Card.dart';

class ButtonListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForeCast> snapshot;

  const ButtonListView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day weather Forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
            height: 140,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: snapshot.data.list.length,
              itemBuilder: (context, index) => Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10),
                  color: Colors.black,
                ),
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                child: forecastCard(snapshot, index),
              ),
            )),
      ],
    );
  }
}
