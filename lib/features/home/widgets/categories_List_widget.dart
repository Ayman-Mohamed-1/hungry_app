// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key});

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  List<String> categories = ['All', 'Combo', 'Sliders', 'Classic', 'Hot'];

  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 14.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: selectedCategoryIndex == index
                    ? AppColors.primary
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: Colors.black12),
              ),
              child: Center(
                child: CustomText(
                  size: 14.sp,
                  text: categories[index],
                  fontWeight: FontWeight.w500,
                  color: selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.grey.shade700,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
