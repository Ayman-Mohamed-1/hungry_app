// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        //* image
        Image.asset(
          "assets/test/test.png",
          width: double.infinity,
          height: 200.h,
        ),
        //* slider for spice level
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 3),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
            ),
            child: Slider(
              inactiveColor: Colors.grey.shade900.withOpacity(0.2),
              activeColor: AppColors.primary.withOpacity(0.7),
              min: 0,
              max: 1,
              //! to do: change
              value: 0.5,
              onChanged: (value) {},
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 53),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Cold 🥶',
                fontWeight: FontWeight.bold,
                size: 12,
              ),
              Gap(100),
              CustomText(
                text: '🌶️ Hot',
                fontWeight: FontWeight.bold,
                size: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
