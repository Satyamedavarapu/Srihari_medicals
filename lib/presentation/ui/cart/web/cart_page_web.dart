import 'package:flutter/material.dart';

class CartPageWeb extends StatefulWidget {
  const CartPageWeb({super.key});

  @override
  State<CartPageWeb> createState() => _CartPageWebState();
}

class _CartPageWebState extends State<CartPageWeb> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Cart Page'),
    ));
  }
}
