part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();
  
  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}



class GetFavouriteCitiesSate extends CityState{
  final List<CityWeather> cities;

 const GetFavouriteCitiesSate(this.cities);
}

class AddCityToFavourieState extends CityState{
 final CityWeather cityWeather ;

  const AddCityToFavourieState(this.cityWeather);
}