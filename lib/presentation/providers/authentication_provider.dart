import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srihari_medicals/app/routing/mobile/mobile_routes.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController loginCtrl = TextEditingController(),
      pwdCtrl = TextEditingController(),
      otpCtrl = TextEditingController();

  bool isLogin = true;

  @override
  void dispose() {
    loginCtrl.dispose();
    pwdCtrl.dispose();
    super.dispose();
  }

  void onSendOtp() {
    isLogin = false;
    notifyListeners();
  }

  void onVerifyOtp(BuildContext context) {
    // isLogin = true;
    Navigator.pushNamedAndRemoveUntil(
        context, MobileRoutes.homeScreen, (Route<dynamic> route) => false);
    notifyListeners();
  }

  void resetVariables() {
    isLogin = true;
  }
}
