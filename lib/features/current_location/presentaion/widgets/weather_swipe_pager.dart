import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../data/model/weather_response_model.dart';
import 'current_conditions.dart';

class WeatherSwipePager extends StatelessWidget {
  const WeatherSwipePager({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220.h,
      child: CurrentConditions(
       weather: weather,
            ));
          }
    
}
    
      