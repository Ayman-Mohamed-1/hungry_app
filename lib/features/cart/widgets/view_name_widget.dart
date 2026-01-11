import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart/data/view_name_data.dart';

class CartViewWidget extends StatelessWidget {
  const CartViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(CartViewData.title));
  }
}
