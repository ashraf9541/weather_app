


import 'package:auto_route/auto_route.dart';



import '../../features/current_location/presentaion/pages/home_page.dart';
import '../../features/current_location/presentaion/widgets/weather_widget.dart';





@MaterialAutoRouter(routes: [

  MaterialRoute(page: HomePage ,initial: true),
    MaterialRoute(page: WeatherWidget , ),

],
replaceInRouteName :'Page , Route'   )
class $Routes {

}

 