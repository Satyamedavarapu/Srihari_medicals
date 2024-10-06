import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebAuthenticationProvider extends ChangeNotifier {
  TextEditingController mobileNumberCtrl = TextEditingController();

  @override
  void dispose() {
    mobileNumberCtrl.dispose();
    super.dispose();
  }
}
