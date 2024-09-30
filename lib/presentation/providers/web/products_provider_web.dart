import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/data/network/web/products_repo.dart';

class ProductsProviderWeb extends ProductsWebRepo with ChangeNotifier {
  StreamController productStream = StreamController.broadcast();

  @override
  void dispose() {
    productStream.close();
    super.dispose();
  }

  void loadProductsByCategory(int id) async {
    try {
      productStream.add(null);

      final query = {'categoryId': id};

      final response = await getCategoryProducts(query);

      if (response != null && response.data != null) {
        var data = response.data
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .toList();

        productStream.add(data);
      }
    } catch (e, s) {
      productStream.addError('Error fetching data: $e $s');
    }
  }
}
