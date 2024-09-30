import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:srihari_medicals/core/urls/endpoints.dart';
import 'package:srihari_medicals/core/util/request_enum.dart';

class BaseService {
  Dio dio = Dio();

  Future<dynamic> onNetworkCall<T>(
      {required url,
      String? baseUrl,
      dynamic body,
      dynamic options,
      Map<String, dynamic>? query,
      Map<String, dynamic>? headers,
      NetworkCallType type = NetworkCallType.get,
      CancelToken? cancelToken}) async {
    _configTimeouts(headers, baseUrl);

    Response response;

    switch (type) {
      case NetworkCallType.post:
        response = await dio.post(url,
            options: options,
            queryParameters: query,
            data: jsonEncode(body),
            cancelToken: cancelToken);
        return response.data;
      case NetworkCallType.get:
        if (query != null && query.isNotEmpty) {
          response = await dio.get(url,
              queryParameters: query, cancelToken: cancelToken);
          return response.data;
        } else {
          response = await dio.get(url);
          return response.data;
        }

      case NetworkCallType.put:
        response = await dio.put(url,
            queryParameters: query, options: options, data: jsonEncode(body));
        return response.data;
      case NetworkCallType.delete:
        response = await dio.delete(url,
            queryParameters: query, options: options, data: jsonEncode(body));
        return response.data;
    }
  }

  void _configTimeouts(Map<String, dynamic>? headers, String? baseUrl) {
    dio.options.connectTimeout = const Duration(minutes: 3);
    dio.options.receiveTimeout = const Duration(minutes: 3);
    dio.options.sendTimeout = const Duration(minutes: 3);
    dio.options.headers = headers ?? {'Content-Type': 'application/json'};
    dio.options.baseUrl = baseUrl ?? Endpoints.baseUrl;
  }
}
