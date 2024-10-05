import 'package:srihari_medicals/core/urls/endpoints.dart';
import 'package:srihari_medicals/data/models/response_model.dart';
import 'package:srihari_medicals/data/network/base_service.dart';

class DashboardWebRepo extends BaseService {
  Future<ResponseModel?> getWebHomeData() async {
    ResponseModel? response;

    final resp = await onNetworkCall(
        baseUrl: 'http://localhost:3000/', url: Endpoints.dashboardWeb);

    if (resp != null) {
      response = ResponseModel.fromJson(resp);
    }

    return response;
  }
}
