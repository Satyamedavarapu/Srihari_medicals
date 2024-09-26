import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';

import '../../../util/widgets/mobile/appbar_mobile.dart';

class OrdersMobile extends StatefulWidget {
  const OrdersMobile({super.key});

  @override
  State<OrdersMobile> createState() => _OrdersMobileState();
}

class _OrdersMobileState extends State<OrdersMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [MobileAppBar(), Text('Orders')],
        ),
      ),
    );
  }
}
