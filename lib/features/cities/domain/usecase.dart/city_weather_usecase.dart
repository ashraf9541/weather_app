import 'package:dartz/dartz.dart';
import 'package:weather_app_ashraf_harba/core/error/failures.dart';
import 'package:weather_app_ashraf_harba/features/cities/domain/repository/city_repository.dart';


import '../../data/model/city_weather_model.dart';



abstract class WeatherCityUseCase {

  Future<Either<Failure,CityWeather>> weatherUseCase (String cityName);
}


class WeatherCityUseCaseImp implements WeatherCityUseCase {
  final CityRepository cityRepository;

  WeatherCityUseCaseImp(this.cityRepository);
  
  @override
  Future<Either<Failure, CityWeather>> weatherUseCase(String cityName) async {
    return await cityRepository.cityRepository(cityName);
  }
}