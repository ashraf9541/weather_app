import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app_ashraf_harba/core/const/cities.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/bloc/weather_bloc.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/widgets/weather_widget.dart';
import '../../../../core/const/cities_model.dart';
import '../../../../injection_container.dart';
import '../../data/model/weather_response_model.dart';
import '../widgets/DropDown.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? weather;
  List<Weather> forecast = [];

  WeatherBloc weatherBloc = sl<WeatherBloc>();
  String city = "Kuala Lumpur";
  double kualaLat =3.1478;
  double kualaLng  =101.6953;
  List<CitiesModel> citiesModel = citiesModelFromJson(jsonEncode(cities));

  @override
  void initState() {
    weatherBloc.add(const GetLocationWeatherEvent(null, null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:   Column(
    
          children: [
            SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: Container(
              
              height: 60.h,
              color: Colors.grey[200],
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: DropDown(
      chosenvalue: city,
      getindex: (val) {},
      hint: city,
      list: citiesModel,
      
      onchanged: (val) {city = val.city;
      weatherBloc.add(GetLocationWeatherEvent(double.parse( val.lat), double.parse( val.lng)));
      },
    ),
              ),
            ),
          ),
            BlocConsumer(
                bloc: weatherBloc,
                listener: (context, state) {
                  if (state is Error) {
                    Fluttertoast.showToast(msg: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is GetCurrentLocationWeatherState) {
                    weather = state.weather;

                    weatherBloc.add(
                         GetForeCastForFiveDaysEvent(kualaLat, kualaLng));
                  }
                  if (state is GetForeCastForFiveDaysState) {
                    weather!.forecast = state.weathers;
      
                    return SizedBox(
                        height: 550.h,
                        child: WeatherWidget(
                          weather: weather!,
                        ));
                  }
                  if (state is Loading){
                    return SizedBox(height: 500.h,
                      child: const Center(child:  CircularProgressIndicator(color: Colors.grey,)));
                  }
                

                  return SizedBox(height: 500.h,
                    child: const Center(child: CircularProgressIndicator(color: Colors.grey,)));
                }),
                SizedBox(height: 10.h,),
                GestureDetector(
                            onTap:  (() {weatherBloc.add( GetCurrentLocationWeatherEvent());
                            }),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 80.w),
                              child: Container(
                                height: 50.h,
                                width: 200.w,
                                decoration:  BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                                ),
                                child: Center(
                                    child: Text(
                                  "My Location",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          )
          ],
        ));
  }


}

   