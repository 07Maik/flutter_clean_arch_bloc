import 'dart:io';

import 'package:dio/dio.dart';

mixin DioExceptions implements Exception {
  late String _message = "";

  bool fromError(error) {
    if (error is! DioError) return false;

    DioError dioError = error;

    switch (dioError.type) {
      case DioErrorType.cancel:
        _message = "Request to API server was cancelled";

        break;
      case DioErrorType.connectionTimeout:
        _message = "Connection timeout with API server";

        break;

      case DioErrorType.badResponse:
        _message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);

        break;

      case DioErrorType.unknown:
        if (dioError is SocketException) {
          _message = "No internet";
        }

        break;

      default:
        _message = "Request no completed";
    }
    return true;
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return error["message"] ?? "No message from server";
      case 500:
        return "internal server error";

      default:
        return "Request no completed";
    }
  }

  @override
  String toString() => _message;
}
