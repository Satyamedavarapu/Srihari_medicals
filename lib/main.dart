import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srihari_medicals/presentation/authentication/login.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/presentation/home/home_page_web.dart';
import 'package:srihari_medicals/providers/authentication_provider.dart';
import 'package:srihari_medicals/providers/mobile/mHome_provider.dart';
import 'package:srihari_medicals/themeing/web_theme.dart';
import 'package:srihari_medicals/routing/mobile_router.dart' as mobileRouter;

final GlobalKey<NavigatorState> mobileNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  if (kIsWeb) {
    runApp(const MyWebApp());
  } else {
    runApp( DevicePreview(
      enabled: !kIsWeb && !kReleaseMode,
        builder: (BuildContext context) =>
        const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthenticationProvider(), lazy: true),
        ChangeNotifierProvider(create: (_) => MobileHomeProvider(), lazy: true),
      ],
      child: MaterialApp(
        title: 'SriHari Medicals',
        theme: WebTheme.webTheme,
        navigatorKey: mobileNavigatorKey,
        onGenerateRoute: mobileRouter.onGenerateMobileRoute,
        home: const LoginPage(),
      ),
    );
  }
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthenticationProvider(), lazy: true),
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
