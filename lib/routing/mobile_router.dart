import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srihari_medicals/presentation/authentication/login.dart';
import 'package:srihari_medicals/presentation/home/mobile/home_screen.dart';
import 'package:srihari_medicals/presentation/home/mobile/orders_mobile.dart';
import 'package:srihari_medicals/presentation/home/mobile/products_mobile.dart';
import 'package:srihari_medicals/presentation/home/mobile/cart_mobile.dart';
import 'package:srihari_medicals/presentation/home/mobile/profile_mobile.dart';
import 'package:srihari_medicals/routing/routes.dart';

Route<dynamic> onGenerateMobileRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MobileRoutes.homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreenMobile());

    case MobileRoutes.products:
      return MaterialPageRoute(builder: (_) => const ProductsMobile());

    case MobileRoutes.orders:
      return MaterialPageRoute(builder: (_) => const OrdersMobile());

    case MobileRoutes.cart:
      return MaterialPageRoute(builder: (_) => const CartMobile());

    case MobileRoutes.profile:
      return MaterialPageRoute(builder: (_) => const ProfileMobile());

    default:
      return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}
