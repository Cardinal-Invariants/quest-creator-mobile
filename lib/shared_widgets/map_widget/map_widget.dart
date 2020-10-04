import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';



class MapWidget extends StatelessWidget {


  static const String ACCESS_TOKEN = "SECRET_TOKEN";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: MapboxMap(
          accessToken: ACCESS_TOKEN,
          initialCameraPosition:
          const CameraPosition(target: LatLng(0.0, 0.0)),
        )
    );
  }
}