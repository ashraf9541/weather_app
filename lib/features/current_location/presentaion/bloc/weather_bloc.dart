
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app_ashraf_harba/features/current_location/domain/usecase/forecast_for_five_days_usecase.dart';

import '../../data/model/weather_response_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  final GetWeatherUseCase currentLocationWeatherUseCase;
  final ForecastForFiveDaysUseCase forecastForFiveDaysUseCase;
  Position? position;
  WeatherBloc(
      this.currentLocationWeatherUseCase, this.forecastForFiveDaysUseCase)
      : super(HomePageInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetCurrentLocationWeatherEvent) {
        emit(Loading());
        final serviceEnabled = await Permission.location.request();
        if (serviceEnabled.isGranted) {
          final position = await geolocatorPlatform.getCurrentPosition();
          var response = await currentLocationWeatherUseCase
              .getCurrentLocationWeatherUsecase(
                  position.latitude, position.longitude);
          response.fold((l) => emit(Error(l.error!)), (r) {
            emit(GetCurrentLocationWeatherState(r));
            add(GetForeCastForFiveDaysEvent(
                position.latitude, position.longitude));
          });
        } else {
          emit(const Error("please enable location service"));
          await [Permission.location].request();
               
              
        }
      }
      if (event is GetForeCastForFiveDaysEvent) {
        var response = await forecastForFiveDaysUseCase.forecastForFiveDays(
            event.lat, event.long);
        response.fold((l) => emit(Error(l.error!)),
            (r) => emit(GetForeCastForFiveDaysState(r)));
      }
      if (event is GetLocationWeatherEvent) {
        var response = await currentLocationWeatherUseCase
            .getCurrentLocationWeatherUsecase(
                event.lat ?? 3.1478, event.long ?? 101.6953);
        response.fold((l) => emit(Error(l.error!)),
            (r) => emit(GetCurrentLocationWeatherState(r)));
      }
    });
  }
}
