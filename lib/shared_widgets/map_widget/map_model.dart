import 'package:flutter/cupertino.dart';
import 'package:quest_creator/shared_widgets/map_widget/marker_model.dart';

class MapModel extends ChangeNotifier {
  final List<Marker> markers = [];
  Marker currentPosition;
  double _zoomLevel = 0;

  get zoomLevel => _zoomLevel;

  void addMarkers(List<Marker> newMarkers) {
    markers.addAll(newMarkers);
    currentPosition = markers[0];
    _zoomLevel = _calculateZoomLevel(markers);
    notifyListeners();
  }

  double _calculateZoomLevel(List<Marker> markers) {
    // ignore: todo
    // TODO: Implement calculate zoom level method.
    return 10;
  }
}
