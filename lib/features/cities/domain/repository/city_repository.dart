import 'package:dartz/dartz.dart';

import 'package:weather_app_ashraf_harba/core/error/failures.dart';

import '../../data/model/city_weather_model.dart';


abstract class CityRepository {
  Future<Either<Failure,CityWeather>> cityRepository (String cityName); 
}


