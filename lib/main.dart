import 'package:flutter/material.dart';
import 'package:flutter_navigation/google_navigation_flutter.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FlutterNavigation()
    );
  }
}

class FlutterNavigation extends StatefulWidget {
  @override
  _FlutterNavigationState createState() => _FlutterNavigationState();
}

class _FlutterNavigationState extends State<FlutterNavigation> {
  //static const platform = const MethodChannel('com.flutter_navigation');
  GoogleMapNavigationFlutter _navigation = GoogleMapNavigationFlutter();

  /*Future<void> initialNavigate(String direccion)async{
    await platform.invokeMethod(
        'initialNavigate',{
          "direccion": direccion
    }
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo'
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Iniciar"),
            onPressed: ()async{
              _navigation.initialNavigate("El+gran+Lucero+del+Alba,Mérida,Yucatán,México");
            }
        ),
      ),
    );
  }
}