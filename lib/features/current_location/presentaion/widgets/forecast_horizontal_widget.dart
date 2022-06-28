import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/widgets/value_tile.dart';

import '../../data/model/weather_response_model.dart';


/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key ?key,
    required this.weathers,
  }) : super(key: key);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weathers.length,
        separatorBuilder: (context, index) => const Divider(
              height: 100,
              color: Colors.white,
            ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {

          final item = weathers[index];
          
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
              DateFormat('E, ha').format(
                  DateTime.fromMillisecondsSinceEpoch(item.time! * 1000)),
              item.temperature!.celsius.toStringAsFixed(2),
              iconData: item.getIconData(),
              
            )),
          );
        },
      ),
    );
  }
}
