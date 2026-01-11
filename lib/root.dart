import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/views/cart_view.dart';
import 'package:hungry_app/features/checkout/views/checkout_view.dart';
import 'package:hungry_app/features/home/views/home_view.dart';
import 'package:hungry_app/features/orderHistory/views/order_history_view.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/glass_nav.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

// ...existing code...
class _RootState extends State<Root> with TickerProviderStateMixin {
  late PageController _pageController;
  late List<Widget> _screens = [];
  int _currentIndex = 0;
  late List<AnimationController> iconControllers;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _screens = [HomeView(), CartView(), OrderHistoryView(), CheckoutView()];
    iconControllers = List.generate(
      4,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    iconControllers[_currentIndex].forward();
  }

  @override
  void dispose() {
    for (final c in iconControllers) {
      c.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
    );

    // Animate selected icon
    iconControllers[index].forward();

    // Reverse others
    for (var i = 0; i < iconControllers.length; i++) {
      if (i != index) iconControllers[i].reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: GlassBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavBarItemData(
              label: 'Home',
              icon: Icon(CupertinoIcons.home),
              filledicon: AnimatedIcon(
                icon: AnimatedIcons.menu_home,
                progress: iconControllers[0],
              ),
            ),
            BottomNavBarItemData(
              label: 'Cart',
              icon: Icon(CupertinoIcons.cart),
              filledicon: Badge(
                label: CustomText(text: '1', size: 10.sp),
                child: AnimatedIcon(
                  icon: AnimatedIcons.view_list,
                  progress: iconControllers[0],
                ),
              ),
            ),
            BottomNavBarItemData(
              label: 'History',
              icon: Icon(Icons.table_bar_outlined),
              filledicon: Icon(Icons.table_bar),
            ),
            BottomNavBarItemData(
              label: 'Profile',
              icon: Icon(CupertinoIcons.person_alt_circle),
              filledicon: AnimatedIcon(
                size: 20.sp,
                icon: AnimatedIcons.arrow_menu,
                progress: iconControllers[0],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
