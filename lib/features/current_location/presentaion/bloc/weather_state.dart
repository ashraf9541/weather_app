part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends WeatherState {}

class GetCurrentLocationWeatherState extends WeatherState {
  final Weather weather;

  const GetCurrentLocationWeatherState(this.weather);
}

class Error extends WeatherState {
  final String error;

  const Error(this.error);
}

class GetForeCastForFiveDaysState extends WeatherState {
  final List<Weather> weathers;

  const GetForeCastForFiveDaysState(this.weathers);
}

class GetDefaultCityWeatherState extends WeatherState {
  final Weather weather;

  const GetDefaultCityWeatherState(this.weather);
}


class Loading extends WeatherState{}