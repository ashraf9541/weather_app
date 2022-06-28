import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/widgets/value_tile.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/widgets/weather_swipe_pager.dart';

import '../../data/model/weather_response_model.dart';
import 'forecast_horizontal_widget.dart';



class WeatherWidget extends StatelessWidget {
  final Weather weather;

  const WeatherWidget({Key? key, required this.weather , }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 500.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weather.cityName!.toUpperCase(),
              style:  TextStyle(
                fontSize: 25.sp,
                letterSpacing: 5,
                color:Colors.grey,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              weather.description!.toUpperCase(),
              style: const TextStyle(
                fontSize: 15,
                letterSpacing: 5,
                fontWeight: FontWeight.w100,
                color:Colors.grey,
              ),
            ),
            WeatherSwipePager(weather: weather),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            ForecastHorizontal(weathers: weather.forecast!),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ValueTile("wind speed", '${weather.windSpeed} m/s'),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color:Colors.grey,
                )),
              ),
              ValueTile(
                  "sunrise",
                  DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                    weather.sunrise! * 1000))),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                )),
              ),
              ValueTile(
                  "sunset",
                  DateFormat('h:m a').format(DateTime.fromMillisecondsSinceEpoch(
                      weather.sunset! * 1000))),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                )),
              ),
              ValueTile("humidity", '${weather.humidity}%'),
            ]),
        
        
          ],
        ),
      ),
    );
  }
}
