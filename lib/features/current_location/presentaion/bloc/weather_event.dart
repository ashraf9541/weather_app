part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}


class GetCurrentLocationWeatherEvent extends WeatherEvent{


}


class GetLocationWeatherEvent extends WeatherEvent{
  final double? lat;
  final double? long;

const  GetLocationWeatherEvent(this.lat, this.long);
  

}



class GetForeCastForFiveDaysEvent extends WeatherEvent{
  final double lat;
  final double long;

  const GetForeCastForFiveDaysEvent(this.lat, this.long);
}