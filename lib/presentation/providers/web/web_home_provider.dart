import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/data/network/web/dashboard_web_repo.dart';

class WebHomeProvider extends DashboardWebRepo with ChangeNotifier {
  HomeModelWeb? homeData;

  StreamController homeDataStreamCtrl = StreamController.broadcast();

  @override
  void dispose() {
    homeDataStreamCtrl.close();
    super.dispose();
  }

  void loadHomeData() async {
    try {
      homeDataStreamCtrl.add(null);

      final response = await getWebHomeData();

      if (response != null && response.data != null) {
        homeData = HomeModelWeb.fromJson(response.data);

        homeDataStreamCtrl.add(homeData);
      } else {
        debugPrint(response?.message);
        homeDataStreamCtrl.add(response?.message ?? false);
      }
    } catch (e, s) {
      debugPrint('$e $s');
      homeDataStreamCtrl.addError(e);
    }
  }
}
