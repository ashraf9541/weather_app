import 'package:weather_app_ashraf_harba/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_ashraf_harba/core/network/network_info.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/repository/weather_repository.dart';


import '../../../../core/exceptions/app_excepition.dart';
import '../data_source/weather_remote_data.dart';
import '../model/weather_response_model.dart';



class WeatherRespoistoryImp implements WeatherRepository {
  final WeatherRemoteData weatherRemoteData;
  final NetworkInf networkInf;

  WeatherRespoistoryImp(this.weatherRemoteData, this.networkInf);

  @override
  Future<Either<Failure, Weather>> currentLocationWeather(double lat, double long) async {
      if (await networkInf.isConnected) {
      try {
        final result = await weatherRemoteData.getCurrentLocationWeather(lat, long);

        return Right((result));
      } catch (e) {
        if (e is AppException) {
          var error = e.message;

          return Left(ServerFailure(error));
        } else {
          return const Left(ServerFailure("server failure"));
        }
      }
    } else {
      return const Left(NetWorkFailure('check internet connection'));
    }
  }
  
  @override
  Future<Either<Failure,List< Weather>>> forecastForFiveDays(double lat, double long) async {

         if (await networkInf.isConnected) {
      try {
        final result = await weatherRemoteData.getForecastForFiveDays(lat, long);

        return Right((result));
      } catch (e) {
        if (e is AppException) {
          var error = e.message;

          return Left(ServerFailure(error));
        } else {
          return const Left(ServerFailure("server failure"));
        }
      }
    } else {
      return const Left(NetWorkFailure('check internet connection'));
    }
   
  }
}