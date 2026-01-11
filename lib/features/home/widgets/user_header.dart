import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: 'Hello,',
                  size: 30.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade500,
                ),
                CustomText(
                  text: ' Rich Sonic',
                  size: 30.sp,
                  fontWeight: FontWeight.w200,
                  color: AppColors.primary,
                ),
              ],
            ),
            // SvgPicture.asset(
            //     'assets/logo/logo.svg',
            //     color: AppColors.primary,
            //     height: 28,
            // ),
            CustomText(
              text: 'Hungry Today?',
              size: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.primary,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: Image.asset('assets/test/kunckles.jpg'),
          ),
        ),
      ],
    );
  }
}
