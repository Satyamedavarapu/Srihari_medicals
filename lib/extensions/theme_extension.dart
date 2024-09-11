import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get darkGreen => Theme.of(this).primaryColor;
  Color get appBarGreen => const Color.fromRGBO(35, 81, 69, 1);
  Color get bgGreen => const Color.fromRGBO(213, 227, 223, 1);
  Color get buttonBg => const Color.fromRGBO(184, 218, 209, 1);
  Color get lightGreen => Theme.of(this).canvasColor;


  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
