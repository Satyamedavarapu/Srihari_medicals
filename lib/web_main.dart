import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srihari_medicals/core/themeing/web_theme.dart';
import 'package:srihari_medicals/presentation/providers/web/cart_provider_web.dart';
import 'package:srihari_medicals/presentation/providers/web/products_provider_web.dart';
import 'package:srihari_medicals/presentation/providers/web/web_auth_provider.dart';
import 'package:srihari_medicals/presentation/providers/web/web_home_provider.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/presentation/ui/home/home_page_web.dart';
import 'package:srihari_medicals/presentation/providers/mobile/authentication_provider.dart';

final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyWebApp());
}

/// Web App Entry Point
class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WebHomeProvider(), lazy: true),
        ChangeNotifierProvider(create: (_) => WebCartProvider(), lazy: true),
        ChangeNotifierProvider(
            create: (_) => WebAuthenticationProvider(), lazy: true),
        ChangeNotifierProvider(
            create: (_) => ProductsProviderWeb(), lazy: true),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SriHari Medicals',
        theme: WebTheme.webTheme,
        home: const MyWebHomePage(),
      ),
    );
  }
}
