import 'package:flutter/services.dart';


class GoogleMapNavigationFlutter{
  static const platform = const MethodChannel('com.flutter_navigation_googlemap');
  Future<void> initialNavigate(String direccion)async{
    await platform.invokeMethod(
        'initialNavigate',{
          "direccion": direccion
    }
    );
  }


}