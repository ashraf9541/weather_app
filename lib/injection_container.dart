

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_ashraf_harba/features/cities/data/remote_data_source/get_city_weather_remote_data.dart';
import 'package:weather_app_ashraf_harba/features/cities/data/repository/city_repository_imp.dart';
import 'package:weather_app_ashraf_harba/features/cities/domain/repository/city_repository.dart';

import 'package:weather_app_ashraf_harba/features/cities/presentation/bloc/city_bloc.dart';

import 'package:weather_app_ashraf_harba/features/current_location/data/repository/weather_repository_imp.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/usecase/forecast_for_five_days_usecase.dart';

import 'core/network/network_info.dart';
import 'core/remote_data_function/http_methods.dart';
import 'package:http/http.dart' as http;

import 'features/cities/domain/usecase.dart/city_weather_usecase.dart';
import 'features/current_location/data/data_source/weather_remote_data.dart';
import 'features/current_location/domain/repository/weather_repository.dart';
import 'features/current_location/presentaion/bloc/weather_bloc.dart';
final sl = GetIt.instance;

Future<void> init() async {
  
  // Bloc
  sl.registerFactory(
    () => WeatherBloc(
      sl(),sl()
    ),
  );
    sl.registerFactory(
    () => CityBloc(
      sl()
    ),
  );


  // Use cases
  sl.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCaseImp(
      sl(),
    ));
     sl.registerLazySingleton<ForecastForFiveDaysUseCase>(
    () => ForecastForFiveDaysUseCaseImp(
      sl(),
    ));

  sl.registerLazySingleton<WeatherCityUseCase>(
    () => WeatherCityUseCaseImp(
      sl(),
    ));
 
  // Repository

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRespoistoryImp(
      sl(),
      sl(),
    ),
  ); 

   sl.registerLazySingleton<CityRepository>(
    () => CityRepositoryImp(
      sl(),
      sl(),
    ),
  ); 



 

  // Data sources

    sl.registerLazySingleton<WeatherRemoteData>(
    () => WeatherRemoteDataImp(sl(), sl()),
  );


    sl.registerLazySingleton<GetCityWeatherRemoteDate>(
    () => GetCityWeatherRemoteDataImp(sl(), sl()),
  );


  
  //! Core
  sl.registerLazySingleton<NetworkInf>(() => NetworkInfImpl(sl()));

  sl.registerLazySingleton<NetworkFunctions>(
    () => NetworkFunctionsImp(sl()),
  );
  

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
