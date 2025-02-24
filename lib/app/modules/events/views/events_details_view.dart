import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:ebony_market_app/app/core/utils/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../core/constant/constant.dart';
import '../controllers/events_controller.dart';
import '../data/model/ticket_model.dart';
import 'components/event_ticket.dart';

class EventsDetailsView extends GetView<EventsController> {
  EventsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Overview',
          style: Poppins.semiBold.copyWith(fontSize: 18, color: GColors.white),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final event = controller.selectedEvent.value;
        if (event == null) {
          return Center(child: Text('No event selected'));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      event.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                10.s,
                Text(
                  event.name,
                  style: Poppins.semiBold.copyWith(fontSize: Tz.xlarge),
                ),
                8.s,
                Row(
                  children: [
                    HeroIcon(
                      HeroIcons.calendar,
                      color: GColors.grey,
                      size: 20,
                    ),
                    5.s,
                    Text(
                      event.date,
                      style: Poppins.medium.copyWith(
                        fontSize: Tz.small,
                        color: GColors.grey,
                      ),
                    ),
                  ],
                ),
                5.s,
                Row(
                  children: [
                    HeroIcon(
                      HeroIcons.mapPin,
                      color: GColors.grey,
                      size: 20,
                    ),
                    5.s,
                    Text(
                      event.location,
                      style: Poppins.medium.copyWith(
                        fontSize: Tz.small,
                        color: GColors.grey,
                      ),
                    ),
                  ],
                ),
                15.s,
                Text(
                  'About event',
                  style: Poppins.medium.copyWith(fontSize: Tz.large),
                ),
                10.s,
                Text(
                  event.description ?? '',
                  style: Poppins.regular.copyWith(fontSize: Tz.small),
                ),
                15.s,
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price Range',
                        style: Poppins.medium.copyWith(
                          fontSize: Tz.large,
                        ),
                      ),
                      SizedBox(height: 8),
                      Obx(() => Text(
                            '\$${controller.currentStartPrice.value.toInt()} - \$${controller.currentEndPrice.value.toInt()}',
                            style: Poppins.semiBold.copyWith(
                              fontSize: 22,
                              color: GColors.primary,
                            ),
                          )),
                      SizedBox(height: 4),
                      // Obx(() => Text(
                      //       'Average price: \$${controller.averagePrice.toInt()}',
                      //       style: Poppins.regular.copyWith(
                      //         fontSize: 16,
                      //         color: GColors.grey,
                      //       ),
                      //     )),
                      Obx(() => RangeSlider(
                            values: RangeValues(
                              controller.currentStartPrice.value,
                              controller.currentEndPrice.value,
                            ),
                            min: 500,
                            max: 10200,
                            activeColor: GColors.borderSecondary,
                            inactiveColor: GColors.dark.withOpacity(0.2),
                            onChanged: (RangeValues values) {
                              controller.updatePriceRange(values);
                            },
                          )),
                    ],
                  ),
                ),
                15.s,
                ButtonPrimary(
                  fullWidth: true,
                  onPressed: () {},
                  text: 'Buy Ticket',
                ),
                10.s,
              ],
            ),
          ),
        );
      }),
    );
  }
}
