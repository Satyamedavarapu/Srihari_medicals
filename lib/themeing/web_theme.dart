import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebTheme {
  static ThemeData webTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor:
        kIsWeb ? Colors.white : const Color.fromRGBO(246, 247, 251, 1),
    primaryColor: const Color.fromRGBO(18, 51, 42, 1),
    canvasColor: const Color.fromRGBO(0, 204, 88, 1),
  );
}
