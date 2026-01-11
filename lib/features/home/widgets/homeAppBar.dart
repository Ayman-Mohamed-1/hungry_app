// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/widgets/search_widget.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';

SliverAppBar homeAppBars(
  // TextEditingController _searchController,
  void Function(String p1) onSearchChanged,
) {
  return SliverAppBar(
    elevation: 0,
    collapsedHeight: 180,
    pinned: true,
    floating: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    flexibleSpace: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 400),
        child: Container(
          color: Colors.white.withAlpha(450).withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
            child: Column(
              children: [
                // ?Header
                UserHeaderWidget(),
                Gap(17.h),
                // ?Search TextField
                SearchWidget(
                  // searchController: _searchController,
                  onChanged: onSearchChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
