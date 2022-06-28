

import 'package:weather_app_ashraf_harba/features/cities/data/model/city_weather_model.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/remote_data_function/http_methods.dart';


abstract class GetCityWeatherRemoteDate {
  Future<dynamic >getCityWeather (String cityNmae);
}


class GetCityWeatherRemoteDataImp implements GetCityWeatherRemoteDate{
  final NetworkInf networkInf ;
  final NetworkFunctions networkFunctions;

  GetCityWeatherRemoteDataImp(this.networkInf, this.networkFunctions);
  
  @override
  Future getCityWeather(String cityNmae) async {
    var response = await networkFunctions.getMethod(baseurl: networkInf.baseUrl,url: "/data/2.5/weather?q=$cityNmae&appid=${networkInf.appId}");
    return CityWeather.fromJson(response);
  }

}