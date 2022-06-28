



import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInf {
  final String baseUrl = "https://api.openweathermap.org";
     final String appId="af3784e5d6b10233303d7afdbb7b4c5a";
  Future<bool> get isConnected;
}

class NetworkInfImpl implements NetworkInf {
  @override
  final String appId="af3784e5d6b10233303d7afdbb7b4c5a";
  final String baseurl = "https://api.openweathermap.org";


   final Connectivity? connectionChecker;

  NetworkInfImpl([
    this.connectionChecker,
  ]);
 @override
  Future<bool> get isConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  @override
  String get baseUrl => baseurl.toString();
  
 

}
