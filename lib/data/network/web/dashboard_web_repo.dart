import 'package:srihari_medicals/core/urls/endpoints.dart';
import 'package:srihari_medicals/data/models/response_model.dart';
import 'package:srihari_medicals/data/network/base_service.dart';

class DashboardWebRepo extends BaseService {
  Future<ResponseModel?> getWebHomeData() async {
    ResponseModel? response;

    await Future.delayed(const Duration(seconds: 5));

    final resp = await onNetworkCall(url: Endpoints.dashboardWeb);

    if (resp != null) {
      response = ResponseModel.fromJson(resp);
    }

    return response;
  }
}
