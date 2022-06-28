// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/current_location/data/model/weather_response_model.dart'
    as _i5;
import '../../features/current_location/presentaion/pages/home_page.dart'
    as _i1;
import '../../features/current_location/presentaion/widgets/weather_widget.dart'
    as _i2;

class Routes extends _i3.RootStackRouter {
  Routes([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    WeatherWidget.name: (routeData) {
      final args = routeData.argsAs<WeatherWidgetArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.WeatherWidget(key: args.key, weather: args.weather));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomePage.name, path: '/'),
        _i3.RouteConfig(WeatherWidget.name, path: '/weather-widget')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i3.PageRouteInfo<void> {
  const HomePage() : super(HomePage.name, path: '/');

  static const String name = 'HomePage';
}

/// generated route for
/// [_i2.WeatherWidget]
class WeatherWidget extends _i3.PageRouteInfo<WeatherWidgetArgs> {
  WeatherWidget({_i4.Key? key, required _i5.Weather weather})
      : super(WeatherWidget.name,
            path: '/weather-widget',
            args: WeatherWidgetArgs(key: key, weather: weather));

  static const String name = 'WeatherWidget';
}

class WeatherWidgetArgs {
  const WeatherWidgetArgs({this.key, required this.weather});

  final _i4.Key? key;

  final _i5.Weather weather;

  @override
  String toString() {
    return 'WeatherWidgetArgs{key: $key, weather: $weather}';
  }
}
