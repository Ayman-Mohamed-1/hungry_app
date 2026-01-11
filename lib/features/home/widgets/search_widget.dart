// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    // required this.searchController,
    required this.onChanged,
  });
  // final TextEditingController searchController;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        cursorHeight: 15.h,
        // controller: searchController,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search..',
          prefixIcon: Icon(CupertinoIcons.search, size: 18.h),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}
