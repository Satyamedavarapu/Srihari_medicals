import 'package:flutter/cupertino.dart';

class MobileHomeProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }


  void resetVariables() {
    selectedIndex = 0;
  }
}
