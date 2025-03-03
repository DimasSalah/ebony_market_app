import 'package:ebony_market_app/app/core/utils/extension/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utils/widgets/buttons/button_primary.dart';
import '../../../core/utils/widgets/textfields/input_primary.dart';
import '../controllers/business_controller.dart';

class BusinessView extends GetView<BusinessController> {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.backgroundColor,
        title: Text(
          'Create Business',
          style: Poppins.semiBold.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: GColors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Business Name
                InputPrimary(
                  label: 'Business Name',
                  hint: 'Enter your business name',
                  controller: controller.businessNameC,
                  isRequired: true,
                  margin: EdgeInsets.only(bottom: 16),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Business name is required';
                    }
                    return null;
                  },
                ),

                // Owner Name
                InputPrimary(
                  label: 'Owner Name',
                  hint: 'Enter owner name',
                  controller: controller.ownerNameC,
                  isRequired: true,
                  margin: EdgeInsets.only(bottom: 16),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Owner name is required';
                    }
                    return null;
                  },
                ),

                // Business Email
                InputPrimary(
                  label: 'Business Email',
                  hint: 'Enter business email',
                  controller: controller.emailC,
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                  margin: EdgeInsets.only(bottom: 16),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),

                // Phone Number
                InputPrimary(
                  label: 'Phone Number',
                  hint: 'Enter phone number',
                  
                  controller: controller.phoneC,
                  isRequired: true,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.only(bottom: 16),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),

                // Business Address
                InputPrimary(
                  label: 'Business Address',
                  hint: 'Enter business address',
                  controller: controller.addressC,
                  isRequired: true,
                  maxLines: 2,
                  margin: EdgeInsets.only(bottom: 16),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),

                // Category Selection
                Text(
                  'Business Category',
                  style: Poppins.semiBold,
                ),
                5.s,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: GColors.borderSecondary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() => DropdownButton<String>(
                        value: controller.selectedCategory.value,
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text('Select Category'),
                        items: controller.categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.setCategory(value);
                          }
                        },
                      )),
                ),
                16.s,

                // Sub Category Selection
                Obx(() => controller.selectedCategory.value != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Sub-Category',
                            style: Poppins.semiBold,
                          ),
                          5.s,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: GColors.borderSecondary),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<String>(
                              value: controller.selectedSubCategory.value,
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text('Select Sub-Category'),
                              items: controller
                                  .getSubCategories(
                                      controller.selectedCategory.value)
                                  .map((subCategory) {
                                return DropdownMenuItem(
                                  value: subCategory,
                                  child: Text(subCategory),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  controller.setSubCategory(value);
                                }
                              },
                            ),
                          ),
                          16.s,
                        ],
                      )
                    : SizedBox()),

                // Operating Hours
                Text(
                  'Operating Hours',
                  style: Poppins.semiBold,
                ),
                10.s,
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.operatingHours.length,
                  itemBuilder: (context, index) {
                    return Obx(() => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              // Day Checkbox
                              Checkbox(
                                value: controller
                                    .operatingHours[index].isOpen.value,
                                onChanged: (value) {
                                  controller.toggleDay(index);
                                },
                              ),
                              // Day Name
                              Text(
                                controller.operatingHours[index].day,
                                style: Poppins.medium,
                              ),
                              Spacer(),
                              // Open Time
                              if (controller
                                  .operatingHours[index].isOpen.value) ...[
                                GestureDetector(
                                  onTap: () => controller.selectTime(
                                      context, index, true),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: GColors.borderSecondary),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      controller
                                          .operatingHours[index].openTime.value,
                                      style: Poppins.regular,
                                    ),
                                  ),
                                ),
                                10.s,
                                Text('-'),
                                10.s,
                                // Close Time
                                GestureDetector(
                                  onTap: () => controller.selectTime(
                                      context, index, false),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: GColors.borderSecondary),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      controller.operatingHours[index].closeTime
                                          .value,
                                      style: Poppins.regular,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ));
                  },
                ),
                16.s,

                // Business Description
                InputPrimary(
                  label: 'Business Description',
                  hint: 'Enter business description',
                  controller: controller.descriptionC,
                  isRequired: true,
                  maxLines: 4,
                  margin: EdgeInsets.only(bottom: 24),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),

                // Submit Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonPrimary(
                      text: 'Create Business',
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.createBusiness();
                        }
                      },
                    ),
                  ],
                ),
                24.s,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
