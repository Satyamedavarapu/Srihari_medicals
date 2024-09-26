import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';

import '../../../util/widgets/mobile/appbar_mobile.dart';

class CartMobile extends StatefulWidget {
  const CartMobile({super.key});

  @override
  State<CartMobile> createState() => _CartMobileState();
}

class _CartMobileState extends State<CartMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [MobileAppBar(), Text('Cart')],
        ),
      ),
    );
  }
}
