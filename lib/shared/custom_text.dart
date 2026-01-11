import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
  });
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textScaler: TextScaler.linear(1.0),
      style: TextStyle(
        fontSize: size ?? 16.sp,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
