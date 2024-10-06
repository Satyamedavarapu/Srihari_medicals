import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srihari_medicals/core/themeing/web_theme.dart';
import 'package:srihari_medicals/presentation/ui/authentication/mobile/login.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/presentation/providers/mobile/authentication_provider.dart';
import 'package:srihari_medicals/presentation/providers/mobile/mHome_provider.dart';
import 'package:srihari_medicals/app/routing/mobile/mobile_router.dart'
    as mobileRouter;

final GlobalKey<NavigatorState> mobileNavigatorKey =
    GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(DevicePreview(
      enabled: !kIsWeb && !kReleaseMode,
      builder: (BuildContext context) => const MyApp()));
}

/// Mobile App Entry Point
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
