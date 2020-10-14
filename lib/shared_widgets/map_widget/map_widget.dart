import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:quest_creator/shared_widgets/map_widget/map_model.dart';

import 'marker_model.dart';

class MapWidget extends StatefulWidget {
  final MapModel mapModel;
  final List<Function(Marker)> onTapCallbacks;
  final String markerImage;
  final double iconSize;

  MapWidget(this.mapModel,
      {this.onTapCallbacks = const [],
      this.markerImage = "marker-15",
      this.iconSize = 3.0});

  void onMarkerTapped(Symbol symbol) {
    for (var tapCallback in this.onTapCallbacks) {
      tapCallback(_convertSymbolToMarker(symbol));
    }
  }

  void moveCamera(MapboxMapController controller, Marker marker, double zoom) {
    CameraUpdate cameraUpdate =
        CameraUpdate.newLatLngZoom(LatLng(marker.lat, marker.long), zoom);
    controller.moveCamera(cameraUpdate);
  }

  Marker _convertSymbolToMarker(Symbol symbol) => Marker(
      id: int.parse(symbol.id),
      lat: symbol.options.geometry.latitude,
      long: symbol.options.geometry.longitude);

  SymbolOptions _getSymbolOptions(Marker marker) => SymbolOptions(
      geometry: LatLng(marker.lat, marker.long),
      iconImage: this.markerImage,
      iconSize: this.iconSize);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static const String ACCESS_TOKEN =
      "pk.eyJ1IjoiZHVzaGVzcyIsImEiOiJja2VmcWpneHcwc201MnluNzl3ZDRjNDl1In0.sV8IejZBXjXoUbHgRGeN6w";
  MapboxMapController controller;

  @override
  Widget build(BuildContext context) {
    var map = MapboxMap(
      accessToken: ACCESS_TOKEN,
      initialCameraPosition: const CameraPosition(target: LatLng(0.0, 0.0)),
      onMapCreated: (mapController) {
        mapController.onSymbolTapped.add(widget.onMarkerTapped);
        setState(() {
          controller = mapController;
        });
      },
    );
    onMapUpdated();
    return new Container(child: map);
  }

  onMapUpdated() {
    if (controller != null && widget.mapModel.markers.isNotEmpty) {
      controller.addSymbols(widget.mapModel.markers
          .map((m) => widget._getSymbolOptions(m))
          .toList());
      widget.moveCamera(controller, widget.mapModel.currentPosition,
          widget.mapModel.zoomLevel);
    }
  }
}
