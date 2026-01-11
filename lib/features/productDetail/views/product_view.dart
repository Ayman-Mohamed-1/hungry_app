// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/features/productDetail/widgets/spicy_slider.dart';
import 'package:hungry_app/features/productDetail/widgets/toping_cart.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 23.h,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(),
              // ! Toppings
              Gap(40.h),
              CustomText(text: 'Toppings', size: 18.sp),
              Gap(10.h),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    // final isSelected = selectedToppingIndex == index;
                    // final topping = toppings?[index];
                    //  if(topping == null) {
                    //     return CupertinoActivityIndicator();
                    //   }
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: TopingCart(
                        // color: isSelected
                        //     ? Colors.green.withOpacity(0.2)
                        //     : AppColors.primary.withOpacity(0.1),
                        // title: topping.name,
                        // imageUrl: topping.image,
                        // onAdd: () => setState(() => selectedToppingIndex = index),
                      ),
                    );
                  }),
                ),
              ),
              Gap(25.h),
              CustomText(text: 'Side Options', size: 18.sp),
              Gap(10.h),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    // final isSelected = selectedToppingIndex == index;
                    // final topping = toppings?[index];
                    //  if(topping == null) {
                    //     return CupertinoActivityIndicator();
                    //   }
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: TopingCart(
                        // color: isSelected
                        //     ? Colors.green.withOpacity(0.2)
                        //     : AppColors.primary.withOpacity(0.1),
                        // title: topping.name,
                        // imageUrl: topping.image,
                        // onAdd: () => setState(() => selectedToppingIndex = index),
                      ),
                    );
                  }),
                ),
              ),

              // !poutton
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withOpacity(0.7),
              AppColors.primary,
              AppColors.primary,
              AppColors.primary,
              AppColors.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Burger Price :',
                    size: 15.sp,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: '\$ 18.9',
                    size: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),

              CustomButton(
                widget: Icon(CupertinoIcons.cart_badge_plus),
                gap: 10.h,
                height: 48.h,
                color: Colors.white,
                textColor: AppColors.primary,
                text: 'Add To Cart',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
