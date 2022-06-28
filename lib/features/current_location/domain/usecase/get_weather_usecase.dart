import 'package:dartz/dartz.dart';
import 'package:weather_app_ashraf_harba/core/error/failures.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/repository/weather_repository.dart';

import '../../data/model/weather_response_model.dart';



abstract class GetWeatherUseCase  {
  Future<Either<Failure, Weather>> getCurrentLocationWeatherUsecase (double lat , double long);

}


class GetWeatherUseCaseImp implements GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCaseImp(this.weatherRepository);
  
  @override
  Future<Either<Failure, Weather>> getCurrentLocationWeatherUsecase(double lat, double long) async {
     return await weatherRepository.currentLocationWeather(lat, long);
  }

  
}
