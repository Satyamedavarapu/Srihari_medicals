import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';

import '../../../core/util/preference_keys.dart';

class WebCartProvider extends ChangeNotifier {
  bool isCartLoading = false;
  List<ProductModel> cartProducts = <ProductModel>[];

  void onCartLoader(bool status) {
    isCartLoading = status;
    notifyListeners();
  }

  void loadCart() async {
    try {
      onCartLoader(true);

      var pref = await SharedPreferences.getInstance();

      List<String>? prodData = pref.getStringList(PreferenceKeys.cartData);

      if (prodData != null) {
        for (var p in prodData) {
          debugPrint('for each prod $p');
          var decodedProd = ProductModel.fromJson(jsonDecode(p));
          cartProducts.add(decodedProd);
        }
      }

      onCartLoader(false);
    } catch (e) {
      debugPrint(e.toString());
      onCartLoader(false);
    }
  }

  void addToCart(ProductModel product) async {
    var pref = await SharedPreferences.getInstance();

    List<String>? existingProds = [];

    product.cartQuantity != null
        ? product.cartQuantity = product.cartQuantity! + 1
        : product.cartQuantity = 1;

    var prod = jsonEncode(product.toJson());

    existingProds = pref.getStringList(PreferenceKeys.cartData);

    existingProds != null
        ? (existingProds.contains(prod)
            ? existingProds
            : existingProds.add(prod))
        : existingProds = [prod];

    pref.setStringList(PreferenceKeys.cartData, existingProds);

    List<String>? prodData = pref.getStringList(PreferenceKeys.cartData);

    debugPrint(prodData.toString());

    if (prodData != null) {
      for (var p in prodData) {
        debugPrint('for each prod $p');

        var decodedProd = ProductModel.fromJson(jsonDecode(p));

        cartProducts.add(decodedProd);
      }
    }
  }

  void clearCart() async {
    onCartLoader(true);
    var pref = await SharedPreferences.getInstance();
    pref.remove(PreferenceKeys.cartData);
    loadCart();
  }

  void resetVariables() {
    cartProducts.clear();
    isCartLoading = false;
  }
}
