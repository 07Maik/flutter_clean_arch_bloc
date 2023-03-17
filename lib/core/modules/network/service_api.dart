import 'package:dio/dio.dart';

import 'package:flutter_clean_arch_bloc/shared/service_constants.dart';

import 'exceptions.dart';

class ServiceApi with DioExceptions {
  late Dio _dio;

  ServiceApi() {
    final optios = BaseOptions(
      headers: {'Content-Type': 'application/json'},
      baseUrl: ServiceConstants.serviceApi,
      connectTimeout: const Duration(
        milliseconds: ServiceConstants.connectTimeout,
      ),
      sendTimeout: const Duration(
        milliseconds: ServiceConstants.sendTimeout,
      ),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    _dio = Dio(optios);

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseHeader: true,
        requestHeader: true,
        responseBody: true,
        requestBody: true,
      ),
    );
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }
}
