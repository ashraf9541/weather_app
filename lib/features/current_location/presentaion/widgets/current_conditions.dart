import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/widgets/value_tile.dart';


import '../../data/model/weather_response_model.dart';



/// Renders Weather Icon, current, min and max temperatures
class CurrentConditions extends StatelessWidget {
  final Weather weather;
  const CurrentConditions({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    int currentTemp = weather.temperature!.celsius.round();
    int maxTemp =  weather.maxTemperature!.celsius.round();
    int minTemp =  weather.minTemperature!.celsius.round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          weather.getIconData(),
          color: Colors.grey,
          size: 70,
        ),
         SizedBox(
          height: 20.h,
        ),
        Text(
          '$currentTemp°',
          style:  TextStyle(
              fontSize:40.sp,
              fontWeight: FontWeight.w100,
              color:Colors.grey),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ValueTile("max", '$maxTemp'),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color: Colors.grey,
            )),
          ),
          ValueTile("min", '$minTemp°'),
        ]),
      ],
    );
  }
}
