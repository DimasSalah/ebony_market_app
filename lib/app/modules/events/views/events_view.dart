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
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Events',
          style: Poppins.semiBold.copyWith(fontSize: 18),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InputPrimary(
                          controller: controller.searchController,
                          hint: 'Search event',
                          suffixIcon: HeroIcon(
                            HeroIcons.magnifyingGlass,
                            color: GColors.grey,
                            size: 20,
                          ),
                          onChanged: (value) => controller.searchEvents(value),
                        ),
                      ),
                      8.s,
                      InkWell(
                        onTap: () => _showFilterBottomSheet(context),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: GColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: HeroIcon(
                            HeroIcons.adjustmentsHorizontal,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.s,
                  Obx(() => Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: controller.selectedCategories
                            .map((category) => FilterChip(
                                  onSelected: (selected) {
                                    if (selected) {
                                      controller.addCategory(category);
                                    } else {
                                      controller.removeCategory(category);
                                    }
                                  },
                                  label: Text(
                                    category,
                                    style: Poppins.medium.copyWith(
                                      fontSize: 12,
                                      color: GColors.primary,
                                    ),
                                  ),
                                  backgroundColor:
                                      GColors.primary.withOpacity(0.1),
                                  onDeleted: () =>
                                      controller.removeCategory(category),
                                  deleteIconColor: GColors.primary,
                                ))
                            .toList(),
                      )),
                ],
              ),
              20.s,
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.filteredEvents.length,
                    itemBuilder: (context, index) => EventCard(
                      event: controller.filteredEvents[index],
                      onTap: () {
                        controller
                            .setSelectedEvent(controller.filteredEvents[index]);
                        Get.toNamed(Routes.EVENT_DETAILS);
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Events',
                  style: Poppins.semiBold.copyWith(fontSize: 18),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: HeroIcon(HeroIcons.xMark),
                ),
              ],
            ),
            10.s,
            Text(
              'Categories',
              style: Poppins.medium.copyWith(fontSize: 16),
            ),
            10.s,
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: controller.eventCategories.map((category) {
                return Obx(() => FilterChip(
                      selected:
                          controller.selectedCategories.contains(category),
                      label: Text(category),
                      onSelected: (selected) {
                        if (selected) {
                          controller.addCategory(category);
                        } else {
                          controller.removeCategory(category);
                        }
                      },
                      selectedColor: GColors.primary.withOpacity(0.2),
                      checkmarkColor: GColors.primary,
                    ));
              }).toList(),
            ),
            16.s,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => controller.clearFilters(),
                  child: Text('Clear All'),
                ),
                16.s,
                ElevatedButton(
                  onPressed: () {
                    controller.applyFilters();
                    Get.back();
                  },
                  child: Text('Apply'),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
