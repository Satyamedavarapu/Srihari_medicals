import 'package:srihari_medicals/data/network/base_service.dart';

import '../../../core/urls/endpoints.dart';
import '../../models/response_model.dart';

class ProductsWebRepo extends BaseService {
  Future<ResponseModel?> getCategoryProducts(Map<String, dynamic> query) async {
    ResponseModel? response;

    await Future.delayed(const Duration(seconds: 2));

    final resp =
        await onNetworkCall(url: Endpoints.getCategoryProducts, query: query);

    if (resp != null) {
      response = ResponseModel.fromJson(resp);
    }

    return response;
  }
}
