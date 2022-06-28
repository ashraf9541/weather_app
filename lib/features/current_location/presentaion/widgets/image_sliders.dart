
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_ashraf_harba/features/current_location/presentaion/widgets/weather_widget.dart';


class ImageSliderS extends StatelessWidget {
  final List<dynamic> weathers;
  const ImageSliderS({Key? key, required this.weathers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  weathers.isNotEmpty?     CarouselSlider.builder(
          itemCount: weathers.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                InkWell(onTap: (){
              
                },
                  child: (
                      ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(20)),
                        child: WeatherWidget(
                               weather: weathers[itemIndex]
                               
                              ),
                  )),
                ),
          options: CarouselOptions(

            height: 170.h,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ):const SizedBox();
  }
}