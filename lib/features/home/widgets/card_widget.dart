import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade100,
              Colors.grey.shade300,
              Colors.grey.shade400,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -8,
                    left: 0,
                    right: 0,
                    child: Image.asset("assets/icon/shadow.png"),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/test/test.png",
                      width: 130.w,
                      height: 135.h,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomText(
                      text: "Cheeseburgerad sad sad sd sadd",
                      size: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    Gap(4.h),
                    CustomText(
                      text: "Wendy's Burger asdsadasa sdsaddsa a",
                      size: 10.sp,
                      color: Colors.black54,
                    ),
                    Gap(8.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.amber,
                          size: 16.sp,
                        ),
                        Gap(4.w),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.heart,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(8.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset("assets/test/test.png", width: 170.w),
//             CustomText(text: "Cheeseburger"),
//             CustomText(text: "Wendy's Burger"),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.amber),
//                 Text("4.5"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
