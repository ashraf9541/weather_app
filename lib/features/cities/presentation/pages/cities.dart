import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app_ashraf_harba/features/cities/presentation/bloc/city_bloc.dart';

import '../../../../core/const/cities.dart';
import '../../../../core/const/cities_model.dart';
import '../../../../injection_container.dart';
import '../../../current_location/presentaion/widgets/DropDown.dart';
import '../../data/model/city_weather_model.dart';

class Cities extends StatefulWidget {
  const Cities({Key? key}) : super(key: key);

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {
    List<CitiesModel> citiesModel = citiesModelFromJson(jsonEncode(cities));
  String city  = "select city";
  CityBloc cityBloc = sl<CityBloc>();
  List<CityWeather> citiesWeather = [];
  @override
  void initState() {
    cityBloc.add(const GetFavouriteCitiesEvent(["Kuala Lumpur","George Town","Johor Bahru"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(foregroundColor: Colors.grey,
      backgroundColor: Colors.grey,
        onPressed: (){
    showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.top),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Add a city",
                          style: TextStyle(color: Colors.grey,fontSize: 16.sp),
                          ),
                        ),
                        dropDown(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      child: const Icon(Icons.add,color: Colors.white,)),
    
      body: BlocConsumer(
        bloc: cityBloc,
        listener: (context, state) {
          if (state is Error){

            Fluttertoast.showToast(msg: state.error);
          }
        },
        builder: (context, state) {
          if (state is AddCityToFavourieState){
            citiesWeather.add(state.cityWeather);
          }
          if (state is Loading){
            return const 
            Center(child: CircularProgressIndicator(color: Colors.grey,));
          }
          if (state is GetFavouriteCitiesSate){
            citiesWeather =state.cities;
          }
          return ListView.builder(
            itemCount: citiesWeather.length,
            itemBuilder: (context, index) {
              return SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                height: 200.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 15),
                              child: Text(
                                citiesWeather[index].name!,
                                 style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(child: Icon(citiesWeather[index].weather![0].getIconData(),size: 40,)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                     (citiesWeather[index]
                                          .main!.temp!-273.15 ).toStringAsFixed(2),
                                           style: TextStyle(fontSize: 18.sp,)
                                          
                                      
                                    ),
                                    Text(citiesWeather[index].weather![0].description!,style: TextStyle(fontSize: 18.sp),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              );
            },
          );
        },
      ),
    );

  }

  dropDown (){
  return  Padding(
    padding:  EdgeInsets.symmetric(horizontal: 20.w),
    child: Container(
                height: 50.h,
                color: Colors.grey[100],
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: DropDown(
        chosenvalue: city,
        getindex: (val) {},
        hint: city,
        list: citiesModel,
        onchanged: (val) {city = val.city;
        cityBloc.add(AddCityToFavourieEvent(city));
        Navigator.of(context).pop();
        },
      ),
                ),
              ),
  );
  }
  
  
}

