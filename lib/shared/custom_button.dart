import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../core/styling/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.color,
    this.height,
    this.radius,
    this.textColor,
    this.widget,
    this.gap,
  });

  final String text;
  final Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final Color? textColor;
  final Widget? widget;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          border: Border.all(color: AppColors.grey200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              color: textColor ?? Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            Gap(gap ?? 0.0),
            widget ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
