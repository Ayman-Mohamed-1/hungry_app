// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/styling/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class GlassBottomNavBar extends StatefulWidget {
  const GlassBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  final int currentIndex;
  final List<BottomNavBarItemData> items;
  final ValueChanged<int> onTap;

  @override
  State<GlassBottomNavBar> createState() => _GlassBottomNavBarState();
}

class BottomNavBarItemData {
  final Widget icon;
  final Widget filledicon;
  final String label;

  BottomNavBarItemData({
    required this.icon,
    required this.filledicon,
    required this.label,
  });
}

class _GlassBottomNavBarState extends State<GlassBottomNavBar> {
  double _pillLeft = 0;
  @override
  void didUpdateWidget(covariant GlassBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updatePill());
  }

  void _updatePill() {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) return;
    final width = box.size.width;
    final itemWidth = width / widget.items.length;
    final targetLeft = itemWidth * widget.currentIndex - (itemWidth - 100) / 2;
    _pillLeft = targetLeft.clamp(3.0, 64.0);
    // setState(() {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Material(
        elevation: 10,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(100),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / widget.items.length;
            final totalWidth = constraints.maxWidth;
            final initialLeft = itemWidth * totalWidth + (itemWidth - 40) / 2;
            if (_pillLeft == 0) _pillLeft = initialLeft;

            return ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 80),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        blurRadius: 25,
                        offset: Offset(10, 40),
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear,
                        left: _pillLeft,
                        top: -4,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.8),
                                Colors.white.withOpacity(0.9),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          // child: SizedBox(),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                            child: SizedBox(),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(widget.items.length, (index) {
                          final item = widget.items[index];
                          final isSelected = index == widget.currentIndex;
                          return Expanded(
                            child: InkWell(
                              onTap: () {
                                widget.onTap(index);
                                final targetLeft =
                                    itemWidth * index + (itemWidth - 10) / 2;
                                setState(() {
                                  _pillLeft = targetLeft.clamp(
                                    3.0,
                                    totalWidth - 100.0,
                                  );
                                });
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                height: 72,
                                decoration: isSelected
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        color: Colors.grey.withOpacity(0.4),
                                      )
                                    : null,
                                padding: isSelected
                                    ? const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 20,
                                      )
                                    : const EdgeInsets.symmetric(vertical: 2),
                                child: Column(
                                  children: [
                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 280,
                                      ),
                                      child: IconTheme(
                                        data: IconThemeData(
                                          size: isSelected ? 22 : 19,
                                          color: isSelected
                                              ? AppColors.primary
                                              : Colors.black54,
                                        ),
                                        child: isSelected
                                            ? item.filledicon
                                            : item.icon,
                                      ),
                                    ),
                                    const Gap(2),
                                    CustomText(
                                      text: item.label,
                                      size: 12,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? AppColors.primary.withOpacity(0.6)
                                          : Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
