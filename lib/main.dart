import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srihari_medicals/presentation/authentication/login.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/presentation/home/home_page_web.dart';
import 'package:srihari_medicals/providers/authentication_provider.dart';
import 'package:srihari_medicals/themeing/web_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  if (kIsWeb) {
    runApp(const MyWebApp());
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthenticationProvider(), lazy: true)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(),
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
            create: (_) => AuthenticationProvider(), lazy: true)
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
