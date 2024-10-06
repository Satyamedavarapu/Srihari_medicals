import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/util/font_constants.dart';

extension ThemeExtension on BuildContext {
  Color get darkGreen => Theme.of(this).primaryColor;
  Color get lightGreen => Theme.of(this).canvasColor;
  Color get appBarGreen => const Color.fromRGBO(35, 81, 69, 1);
  Color get bgGreen => const Color.fromRGBO(213, 227, 223, 1);
  Color get buttonBg => const Color.fromRGBO(184, 218, 209, 1);
  Color get buttonCreamBg => const Color.fromRGBO(246, 247, 251, 1);
  Color get redColor => const Color.fromRGBO(255, 0, 0, 1);

  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  TextStyle get buttonWhiteStyle => const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat-Bold');

  TextStyle get noramlWhiteStyle => const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontFamily: 'Montserrat');

  TextStyle get itallicWhiteStyle => const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      fontFamily: 'Montserrat-Itallic');

  TextStyle get itallicBlackStyle => const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      fontFamily: 'Montserrat-Itallic');

  TextStyle get titleStyle => const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat-Bold');

  TextStyle get subTitleStyle => const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontFamily: 'Montserrat-Bold');

  TextStyle get cartTotalStyle => const TextStyle(
      color: Color.fromRGBO(26, 32, 44, 1),
      fontFamily: FontConstants.montserrat);
}
