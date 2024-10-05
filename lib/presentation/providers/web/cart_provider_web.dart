import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';

import '../../../core/util/preference_keys.dart';

class WebCartProvider extends ChangeNotifier {
  List<ProductModel> cartProducts = <ProductModel>[];

  void addToCart(ProductModel product) async {
    var pref = await SharedPreferences.getInstance();

    List<String>? existingProds = [];

    product.cartQuantity != null
        ? product.cartQuantity = product.cartQuantity! + 1
        : product.cartQuantity = 1;

    var prod = jsonEncode(product).toString();

    existingProds = pref.getStringList(PreferenceKeys.cartData);

    existingProds != null
        ? (existingProds.contains(prod)
            ? existingProds
            : existingProds.add(prod))
        : existingProds = [prod];

    pref.setStringList(PreferenceKeys.cartData, existingProds);

    var prodData = pref.getStringList(PreferenceKeys.cartData);

    var latestCart = prodData!
        .map<ProductModel>((e) => ProductModel.fromJson(jsonDecode(e)))
        .toList();

    debugPrint(prodData.toString());
    debugPrint(latestCart.toString());
  }

  void clearCart() async {
    var pref = await SharedPreferences.getInstance();

    pref.remove(PreferenceKeys.cartData);
  }
}
