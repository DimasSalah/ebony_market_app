import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/helper/date_picker.dart';
import '../../../../core/utils/widgets/buttons/button_primary.dart';
import '../../../../core/utils/widgets/cards/card_app.dart';
import '../../../../core/utils/widgets/textfields/input_primary.dart';
import '../../controllers/events_controller.dart';

class EventForm extends StatelessWidget {
  const EventForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventsController());
    return CardApp(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      isOutlined: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Event',
            style: Poppins.regular.copyWith(fontSize: 16),
          ),
          10.s,
          Text(
            'Image event',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          5.s,
          CardApp(
            width: double.infinity,
            isOutlined: true,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: HeroIcon(HeroIcons.arrowUpTray),
          ),
          10.s,
          Text(
            'Event date',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          5.s,
          Row(
            children: [
              Expanded(
                child: InputPrimary(
                  controller: controller.startDateC,
                  hint: 'Start date',
                  hintStyle: Poppins.regular.copyWith(fontSize: Tz.small),
                  isDense: true,
                  onTap: () async {
                    final date =
                        await DatePickerHelper.showDateTimePicker(context);
                    if (date != null) {
                      controller.startDateC.text = date;
                    }
                  },
                ),
              ),
              10.s,
              Expanded(
                child: InputPrimary(
                  controller: controller.endDateC,
                  hint: 'End date',
                  hintStyle: Poppins.regular.copyWith(fontSize: Tz.small),
                  isDense: true,
                  onTap: () async {
                    final date =
                        await DatePickerHelper.showDateTimePicker(context);
                    if (date != null) {
                      controller.endDateC.text = date;
                    }
                  },
                ),
              )
            ],
          ),
          10.s,
          Text(
            'Description',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          5.s,
          InputPrimary(
            controller: controller.descriptionC,
            hint: 'Description',
            hintStyle: Poppins.regular.copyWith(fontSize: Tz.small),
            isDense: true,
          ),
          10.s,
          Text(
            'Code coupon',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          5.s,
          InputPrimary(
            controller: controller.codeCouponC,
            hint: 'Code coupon',
            hintStyle: Poppins.regular.copyWith(fontSize: Tz.small),
            isDense: true,
          ),
          10.s,
          Text(
            'Website link',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          5.s,
          InputPrimary(
            controller: controller.websiteLinkC,
            hint: 'Website link',
            hintStyle: Poppins.regular.copyWith(fontSize: Tz.small),
            isDense: true,
          ),
          10.s,
          Text(
            'Social link',
            style: Poppins.regular.copyWith(fontSize: Tz.small),
          ),
          5.s,
          InputPrimary(
            controller: controller.socialLinkC,
            hint: 'Social link',
            hintStyle: Poppins.regular.copyWith(fontSize: Tz.small),
            isDense: true,
          ),
          10.s,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonPrimary(
                text: 'Save',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
