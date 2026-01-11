import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/productDetail/views/product_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:hungry_app/features/home/widgets/card_widget.dart';
import 'package:hungry_app/features/home/widgets/categories_List_widget.dart';
import 'package:hungry_app/features/home/widgets/search_widget.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    // _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    // Placeholder for search/filter logic. Replace with real implementation.
    debugPrint('Search query: $value');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Skeletonizer(
        // ignoreContainers: true,
        enabled: false,
        child: Scaffold(
          // backgroundColor: AppColors.primary,
          body: CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              // !header with search
              SliverAppBar(
                elevation: 0,
                collapsedHeight: 180.h,
                pinned: true,
                floating: false,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                flexibleSpace: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      // ignore: deprecated_member_use
                      color: Colors.white.withAlpha(450).withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 70,
                          right: 20,
                          left: 20,
                        ),
                        child: Column(
                          children: [
                            // ?Header
                            const UserHeaderWidget(),
                            Gap(17.h),
                            // ?Search TextField
                            SearchWidget(
                              // searchController: _searchController,
                              onChanged: _onSearchChanged,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///! Category
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: CategoriesListWidget(),
                ),
              ),
              // ! Card Item
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.73,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(childCount: 10, (
                    context,
                    index,
                  ) {
                    // final product =products[index];
                    // if (prouct == null) {
                    //   return CupertinoActivityIndicator();
                    // }
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailView(),
                        ),
                      ),
                      child: const CardWidget(),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
