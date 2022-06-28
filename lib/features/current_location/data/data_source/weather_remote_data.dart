

import '../../../../core/network/network_info.dart';
import '../../../../core/remote_data_function/http_methods.dart';
import '../model/weather_response_model.dart';

abstract class WeatherRemoteData {
  Future<dynamic> getCurrentLocationWeather(double lat , double long);
  Future<dynamic> getForecastForFiveDays (double lat , double long);
}


class WeatherRemoteDataImp implements WeatherRemoteData{
  final NetworkFunctions networkFunctions;
  final NetworkInf networkInf;

WeatherRemoteDataImp (this.networkFunctions, this.networkInf);
  
  @override
  Future getCurrentLocationWeather(double lat , double long) async {
 
    var response = await networkFunctions.getMethod(url: 
    "/data/2.5/weather?lat=$lat&lon=$long&appid=${networkInf.appId}",baseurl: networkInf.baseUrl);
    
    return Weather.fromJson(response);
  }
  
  @override
  Future getForecastForFiveDays(double lat, double long) async {
   
    var response = await networkFunctions.getMethod(url: 
    "/data/2.5/forecast?lat=$lat&lon=$long&appid=${networkInf.appId}",baseurl: networkInf.baseUrl);
    return Weather.fromForecastJson(response);
  }
}