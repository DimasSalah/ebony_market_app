import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/widgets/cards/card_app.dart';
import '../../data/model/ticket_model.dart';

class EventTicket extends StatelessWidget {
  final TicketModel ticket;
  final bool isSelected;
  final Function()? onSelected;
  const EventTicket({
    super.key,
    required this.ticket,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return CardApp(
      onTap: onSelected,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      isOutlined: true,
      outlineColor: isSelected ? GColors.primary : GColors.borderSecondary,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: GColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: HeroIcon(
              HeroIcons.ticket,
              color: GColors.primary,
              size: 24,
            ),
          ),
          8.s,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.name,
                style: Poppins.medium.copyWith(fontSize: Tz.small),
              ),
              Text(
                ticket.description,
                style: Poppins.medium.copyWith(
                  fontSize: Tz.small,
                  color: GColors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            '\$${ticket.price}',
            style: Poppins.semiBold.copyWith(fontSize: Tz.xlarge),
          ),
        ],
      ),
    );
  }
}
