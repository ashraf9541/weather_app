import 'package:dartz/dartz.dart';
import 'package:weather_app_ashraf_harba/core/error/failures.dart';

import '../../data/model/weather_response_model.dart';


abstract class WeatherRepository{
  Future<Either<Failure,Weather > >currentLocationWeather(double lat ,double long );
    Future<Either<Failure,List<Weather >> >forecastForFiveDays(double lat ,double long );
}