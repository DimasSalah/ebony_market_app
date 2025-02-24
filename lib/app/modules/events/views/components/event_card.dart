import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/widgets/cards/card_app.dart';
import '../../data/model/event_model.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;
  const EventCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CardApp(
        margin: const EdgeInsets.only(bottom: 10),
        outlineColor: GColors.primary.withValues(alpha: 0.5),
        radius: 20,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        isOutlined: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    color: GColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      event.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'CAD \$${event.price}',
                          style: Poppins.medium.copyWith(
                            fontSize: Tz.small,
                            color: GColors.primary,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: HeroIcon(HeroIcons.heart,
                            color: GColors.black, size: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.s,
            Text(
              event.name,
              style: Poppins.semiBold.copyWith(fontSize: 16),
            ),
            5.s,
            Row(
              children: [
                HeroIcon(
                  HeroIcons.calendar,
                  color: GColors.primary,
                  size: 20,
                ),
                5.s,
                Text(
                  event.date,
                  style: Poppins.medium.copyWith(
                    fontSize: Tz.small,
                    color: GColors.primary,
                  ),
                ),
              ],
            ),
            3.s,
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
          ],
        ),
      ),
    );
  }
}
