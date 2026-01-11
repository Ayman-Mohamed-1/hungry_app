import 'package:flutter/material.dart';
import 'package:hungry_app/features/checkout/data/view_name_data.dart';

class CheckoutViewWidget extends StatelessWidget {
  const CheckoutViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(CheckoutViewData.title));
  }
}
