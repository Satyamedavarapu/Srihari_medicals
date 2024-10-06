import 'package:flutter/material.dart';
import 'package:srihari_medicals/app/routing/mobile/mobile_routes.dart';
import 'package:srihari_medicals/presentation/ui/authentication/mobile/login.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/home_screen.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/orders_mobile.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/products_mobile.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/cart_mobile.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/profile_mobile.dart';

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
