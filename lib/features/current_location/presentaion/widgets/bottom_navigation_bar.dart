import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cities/presentation/pages/cities.dart';
import '../pages/home_page.dart';



class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  List<Widget> list = [
    
    const HomePage(),

    const Cities()
  ];

  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: ((value) {
          index = value;
          setState(() {});
        }),
        selectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        currentIndex: index, // this will be set when a new tab is tapped
        items: [
           BottomNavigationBarItem(
            icon: Icon(  Icons.home      ,        size: 25.w,),
            label: "",
          ),
      
  
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pin_drop,
             
              size: 25.w,
            ),
            label: "",
          ),
        ],
      ),
      body: list[index],
    );
  }
}