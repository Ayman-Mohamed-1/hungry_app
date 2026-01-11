import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class TopingCart extends StatelessWidget {
  const TopingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Column(
                children: [
                  Image.asset(
                    "assets/test/tomato.png",
                    width: 80.w,
                    height: 50.h,
                    fit: BoxFit.contain,
                  ),
                  Gap(10.h),
                  CustomText(
                    text: "test",
                    size: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(5.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
