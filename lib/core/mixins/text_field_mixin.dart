import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/web_main.dart';

mixin TextFieldMixin {
  OutlineInputBorder get border => OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(webNavigatorKey.currentContext!.width * 0.002),
      borderSide:
          BorderSide(color: webNavigatorKey.currentContext!.buttonCreamBg));

  OutlineInputBorder get disabledBorder => OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(webNavigatorKey.currentContext!.width * 0.002),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)));

  OutlineInputBorder get errorBorder => OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(webNavigatorKey.currentContext!.width * 0.002),
      borderSide: const BorderSide(color: Colors.redAccent));
}
