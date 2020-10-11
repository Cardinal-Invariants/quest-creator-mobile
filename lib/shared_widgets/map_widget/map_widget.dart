import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
class Marker
{
  int id;
  double Lat;
  double Long;
  Marker(int id,double Lat,double Long)
  {
    this.id=id;
    this.Lat=Lat;
    this.Long=Long;
  }
  Marker.fromSymbol(Symbol symbol)
  {
    this.id=int.parse(symbol.id);
    this.Lat=symbol.options.geometry.latitude;
    this.Long=symbol.options.geometry.longitude;
  }
}
class MapWidget extends StatelessWidget {


  static const String ACCESS_TOKEN = "pk.eyJ1IjoiZHVzaGVzcyIsImEiOiJja2VmcWpneHcwc201MnluNzl3ZDRjNDl1In0.sV8IejZBXjXoUbHgRGeN6w";
  MapboxMap map;
  MapboxMapController controller;
  Function(Marker) onTapCallback;

  MapWidget([Function(Marker) onTapCallback])
  {
    this.onTapCallback=onTapCallback;
  }
  @override
  Widget build(BuildContext context) {

    this.map= MapboxMap(
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
    controller.onSymbolTapped.add(onMarkerTap);

  }

  void onMarkerTap(Symbol symbol)
  {
    if (this.onTapCallback!=null)
    {
    this.onTapCallback( new Marker.fromSymbol(symbol));
    }

  }

  int addMarker(double lat, double long)
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
  void removeMarker(int id)
  {
    var symbol=this.controller.symbols.where((element) => element.id==id.toString());
    this.controller.removeSymbol(symbol.first);
  }
  void moveCamera(double lat,double long,double zoom)
  {
    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(LatLng(lat, long), zoom);
    this.controller.moveCamera(cameraUpdate);
  }
}