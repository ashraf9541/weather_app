part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}


class GetFavouriteCitiesEvent extends CityEvent{
 final List<String > citiesName;

const  GetFavouriteCitiesEvent(this.citiesName);
}



class AddCityToFavourieEvent extends CityEvent{
  final String cityName;

  const AddCityToFavourieEvent(this.cityName);
}

class Loading extends CityState{}


class Error extends CityState{
  final String error;

 const Error(this.error);
}