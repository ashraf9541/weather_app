import 'package:weather_app_ashraf_harba/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_ashraf_harba/core/network/network_info.dart';
import 'package:weather_app_ashraf_harba/features/cities/data/model/city_weather_model.dart';
import 'package:weather_app_ashraf_harba/features/cities/data/remote_data_source/get_city_weather_remote_data.dart';
import 'package:weather_app_ashraf_harba/features/cities/domain/repository/city_repository.dart';

import '../../../../core/exceptions/app_excepition.dart';




class CityRepositoryImp implements CityRepository{
  final NetworkInf networkInf;
  final GetCityWeatherRemoteDate getCityWeatherRemoteDataImp;

  CityRepositoryImp(this.networkInf, this.getCityWeatherRemoteDataImp);

  @override
  Future<Either<Failure, CityWeather>> cityRepository(String cityName) async {
           if (await networkInf.isConnected) {
      try {
        final result = await getCityWeatherRemoteDataImp.getCityWeather(cityName);

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