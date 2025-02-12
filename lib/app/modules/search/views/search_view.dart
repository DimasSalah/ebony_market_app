import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utils/widgets/textfields/input_primary.dart';
import '../controllers/search_controller.dart' as sc;

class SearchView extends GetView<sc.SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller.mapController,
            options: MapOptions(
              initialCenter:
                  LatLng(56.130366, -106.346771), // Canada's approximate center
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                tileProvider: NetworkTileProvider(),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4, // Initial height (40% of screen)
            minChildSize: 0.1, // Minimum height (10% of screen)
            maxChildSize: 0.9, // Maximum height (90% of screen)
            snap: true,
            snapSizes: const [0.1, 0.4, 0.9],
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      // Drag handle
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      // Search input
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: InputPrimary(
                          hint: 'Search location',
                          suffixIcon: HeroIcon(
                            HeroIcons.magnifyingGlass,
                            color: GColors.primary,
                          ),
                        ),
                      ),
                      // Content area
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20, // Example item count
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const HeroIcon(HeroIcons.mapPin),
                              title: Text('Location ${index + 1}'),
                              subtitle: const Text('Address details here'),
                              onTap: () {
                                // Handle location selection
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 80,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: "zoomin",
                  backgroundColor: Colors.grey[300],
                  onPressed: controller.zoomInMap,
                  child: const Icon( 
                    Icons.zoom_in,
                    color: Colors.black,
                  ),
                ),
                8.s,
                FloatingActionButton.small(
                  heroTag: "zoomout",
                  backgroundColor: Colors.grey[300],
                  onPressed: controller.zoomOutMap,
                  child: const Icon(
                    Icons.zoom_out,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
