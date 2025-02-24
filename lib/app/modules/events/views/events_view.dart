import 'package:ebony_market_app/app/core/constant/constant.dart';
import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../../core/utils/widgets/textfields/input_primary.dart';
import '../../../routes/app_pages.dart';
import '../controllers/events_controller.dart';
import 'components/event_card.dart';
import 'components/event_form.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.primary,
        title: Text(
          'Events',
          style: Poppins.semiBold.copyWith(
            fontSize: 18,
            color: GColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.s,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Request to add an event',
                    style: Poppins.regular
                        .copyWith(fontSize: 14, color: GColors.textGrey),
                  ),
                  10.s,
                  IconButton(
                    onPressed: controller.toggleEventForm,
                    icon: Obx(
                      () {
                        return Icon(
                          controller.isShowEventForm.value
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: GColors.primary,
                          size: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  return Visibility(
                    visible: controller.isShowEventForm.value,
                    child: const EventForm(),
                  );
                },
              ),
              10.s,
              Divider(
                height: 1,
                color: GColors.borderSecondary,
              ),
              10.s,
              Text(
                'Featured events',
                style: Poppins.semiBold.copyWith(fontSize: 18),
              ),
              10.s,
              InputPrimary(
                hint: 'Search event',
                suffixIcon: HeroIcon(
                  HeroIcons.magnifyingGlass,
                  color: GColors.grey,
                  size: 20,
                ),
              ),
              20.s,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.eventsDummy.length,
                itemBuilder: (context, index) => EventCard(
                  event: controller.eventsDummy[index],
                  onTap: () {
                    controller.setSelectedEvent(controller.eventsDummy[index]);
                    Get.toNamed(Routes.EVENT_DETAILS);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
