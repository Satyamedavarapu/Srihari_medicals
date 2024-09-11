import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srihari_medicals/presentation/home/home_page.dart';

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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false);
    notifyListeners();
  }

  void resetVariables() {
    isLogin = true;
  }
}
