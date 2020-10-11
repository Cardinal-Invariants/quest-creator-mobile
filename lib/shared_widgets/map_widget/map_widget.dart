import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'dart:developer' as developer;
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:http/http.dart';

class MapWidget extends StatelessWidget {


  static const String ACCESS_TOKEN = "pk.eyJ1IjoiZHVzaGVzcyIsImEiOiJja2VmcWpneHcwc201MnluNzl3ZDRjNDl1In0.sV8IejZBXjXoUbHgRGeN6w";
  MapboxMap map;
  MapboxMapController controller;
  Function(Symbol) onTapCallback;


  MapWidget([Function(Symbol) onTapCallback])
  {
    this.onTapCallback=onTapCallback;
  }

  @override
  Widget build(BuildContext context) {

    map= MapboxMap(

      accessToken: ACCESS_TOKEN,
      initialCameraPosition:
      const CameraPosition(target: LatLng(0.0, 0.0)),
      onMapCreated: onMapCreated,

    );
    return new Scaffold(
        body: this.map
    );
  }

  void onMapCreated(MapboxMapController controller) {
    this.controller = controller;
    controller.onSymbolTapped.add(onTapCallback);
  }


  int AddMarker(double lat, double long)
  {

    this.controller.addSymbol(
      SymbolOptions(
          geometry: LatLng(lat, long),
          iconImage: "marker-15",
          iconSize: 3
      ),
    );

    return int.parse(this.controller.symbols.last.id)+1;


  }
  void MoveMap(double lat,double long,double zoom)
  {
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(LatLng(lat, long), zoom);
    this.controller.moveCamera(cameraUpdate);
  }
}