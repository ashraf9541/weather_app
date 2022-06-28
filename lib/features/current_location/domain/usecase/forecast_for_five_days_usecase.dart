import 'package:dartz/dartz.dart';
import 'package:weather_app_ashraf_harba/core/error/failures.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/repository/weather_repository.dart';
import '../../data/model/weather_response_model.dart';



abstract class ForecastForFiveDaysUseCase  {
  Future<Either<Failure,List< Weather>>> forecastForFiveDays (double lat , double long);

}


class ForecastForFiveDaysUseCaseImp implements ForecastForFiveDaysUseCase {
  final WeatherRepository weatherRepository;

  ForecastForFiveDaysUseCaseImp(this.weatherRepository);
  
 
  @override
  Future<Either<Failure, List< Weather>>> forecastForFiveDays(double lat, double long) async {
   return await weatherRepository.forecastForFiveDays(lat, long);
  }

  
}
