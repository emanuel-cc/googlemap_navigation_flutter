package com.example.flutter_navigation;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;

//import io.flutter.app.FlutterActivity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


import android.content.Intent;
import android.net.Uri;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.flutter_navigation_googlemap";
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                if(call.method.equals("initialNavigate")){
                    String direccion = call.argument("direccion");
                    initialNavigate(direccion);
                }else{
                  result.notImplemented();
                }
              }
            }
    );
  }

  public void initialNavigate(String direccion){
    Uri gmmIntentUri = Uri.parse("google.navigation:q="+direccion);
    Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
    mapIntent.setPackage("com.google.android.apps.maps");
    //El+gran+Lucero+del+Alba,Mérida,Yucatán,México
    startActivity(mapIntent);

    /*

    String url = "https://www.google.com/maps/dir/?api=1&destination=Madrid,Spain&origin=Barcelona,Spain&waypoints=Zaragoza|Huesca&travelmode=driving&dir_action=navigate";
Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
startActivity(intent);

     */
  }
}
