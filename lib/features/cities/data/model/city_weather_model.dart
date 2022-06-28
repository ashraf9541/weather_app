// To parse this JSON data, do
//
//     final cityWeather = cityWeatherFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../../core/utils/weather_icon_mapper.dart';

CityWeather cityWeatherFromJson(String str) => CityWeather.fromJson(json.decode(str));
String citiesWeatherToJson(List<CityWeather> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
List<CityWeather> citiesWeatherFromJson(String str) => List<CityWeather>.from(json.decode(str).map((x) => CityWeather.fromJson(x)));

String cityWeatherToJson(CityWeather data) => json.encode(data.toJson());

class CityWeather {
    CityWeather({
        this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    Coord ?coord;
    List<WeatherForCity>? weather;
    String? base;
    Main? main;
    int ?visibility;
    Wind ?wind;
    Clouds? clouds;
    int ?dt;
    Sys ?sys;
    int ?timezone;
    int? id;
    String? name;
    int? cod;

    factory CityWeather.fromJson(Map<String, dynamic> json) => CityWeather(
        coord: Coord.fromJson(json["coord"]),
        weather: List<WeatherForCity>.from(json["weather"].map((x) => WeatherForCity.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );
    

    Map<String, dynamic> toJson() => {
        "coord": coord!.toJson(),
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "base": base,
        "main": main!.toJson(),
        "visibility": visibility,
        "wind": wind!.toJson(),
        "clouds": clouds!.toJson(),
        "dt": dt,
        "sys": sys!.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    int ?all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Coord {
    Coord({
        this.lon,
        this.lat,
    });

    double ?lon;
    double ?lat;

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class Main {
    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    double ?temp;
    double ?feelsLike;
    double ?tempMin;
    double ?tempMax;
    int ?pressure;
    int ?humidity;

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}

class Sys {
    Sys({
        this.type,
        this.id,
        this.country,
        this.sunrise,
        this.sunset,
    });

    int ?type;
    int? id;
    String ?country;
    int ?sunrise;
    int ?sunset;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class WeatherForCity {
    WeatherForCity({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int ?id;
    String ?main;
    String ?description;
    String ?icon;

    factory WeatherForCity.fromJson(Map<String, dynamic> json) => WeatherForCity(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };

      IconData getIconData(){
    switch(icon){
      case '01d': return WeatherIcons.clearDay;
      case '01n': return WeatherIcons.clearNight;
      case '02d': return WeatherIcons.fewCloudsDay;
      case '02n': return WeatherIcons.fewCloudsDay;
      case '03d':
      case '04d':
        return WeatherIcons.cloudsDay;
      case '03n':
      case '04n':
        return WeatherIcons.clearNight;
      case '09d': return WeatherIcons.showerRainDay;
      case '09n': return WeatherIcons.showerRainNight;
      case '10d': return WeatherIcons.rainDay;
      case '10n': return WeatherIcons.rainNight;
      case '11d': return WeatherIcons.thunderStormDay;
      case '11n': return WeatherIcons.thunderStormNight;
      case '13d': return WeatherIcons.snowDay;
      case '13n': return WeatherIcons.snowNight;
      case '50d': return WeatherIcons.mistDay;
      case '50n': return WeatherIcons.mistNight;
      default: return WeatherIcons.clearDay;
    }
  }
}

class Wind {
    Wind({
        this.speed,
        this.deg,
    });

    double? speed;
    int? deg;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
    };


}
