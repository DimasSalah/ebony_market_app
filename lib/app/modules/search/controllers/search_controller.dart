import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  final mapController = MapController();

  void zoomOutMap() {
    mapController.move(
        mapController.camera.center, mapController.camera.zoom - 1);
  }

  void zoomInMap() {
    mapController.move(
        mapController.camera.center, mapController.camera.zoom + 1);
  }
}
