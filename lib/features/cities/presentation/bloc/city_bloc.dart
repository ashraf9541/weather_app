

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../injection_container.dart';
import '../../data/model/city_weather_model.dart';
import '../../domain/usecase.dart/city_weather_usecase.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final WeatherCityUseCase weatherCityUSeCase;
  CityBloc(this.weatherCityUSeCase) : super(CityInitial()) {
    List<CityWeather> citiesWeather = [];
    final sharedPreferences = sl<SharedPreferences>();
    on<CityEvent>((event, emit) async {
      if (event is GetFavouriteCitiesEvent) {
        if (sharedPreferences.getString("Cities") == null) {
         
            emit(Loading());
            for (var i = 0; i < event.citiesName.length; i++) {
              var response =
                  await weatherCityUSeCase.weatherUseCase(event.citiesName[i]);
              response.fold((l) => emit(Error(l.error!)), (r) {
                citiesWeather.add(r);
              });

              var citiesInJson = citiesWeatherToJson(citiesWeather);

              sharedPreferences.setString("Cities", citiesInJson);
            }

            emit(GetFavouriteCitiesSate(citiesWeather));
          }
         else {
          emit(GetFavouriteCitiesSate(citiesWeatherFromJson(
              sl<SharedPreferences>().getString("Cities")!)));
        }
      }
      if (event is AddCityToFavourieEvent){
        emit (Loading());
        var response = await weatherCityUSeCase.weatherUseCase(event.cityName);
        response.fold((l) => emit(Error(l.error!)), (r) {
          try{
      final   cities =     citiesWeatherFromJson(
              sl<SharedPreferences>().getString("Cities")!);
              cities.add(r);
                            var citiesInJson = citiesWeatherToJson(cities);

              sharedPreferences.setString("Cities", citiesInJson);

              emit (AddCityToFavourieState(r));

          }
          catch (e){
            emit (const Error("Error in cashing"));
          }
        }
        );
      }
    });

    

  }
  
}
