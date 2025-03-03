import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/helper/global_text_format.dart';
import '../../../../routes/app_pages.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: GColors.primary,
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          ListTile(
            title: Text(GFormat.getGreetingText(),
                style: Poppins.regular
                    .copyWith(color: GColors.white, fontSize: 16)),
            subtitle: Text('Jhon Doe',
                style: Poppins.semiBold
                    .copyWith(color: GColors.white, fontSize: 16)),
            trailing: GestureDetector(
                onTap: () => Get.toNamed(Routes.PROFILE),
                child: HeroIcon(HeroIcons.userCircle,
                    color: GColors.white, size: 34)),
          ),
        ],
      ),
    );
  }
}
