import 'package:flutter/material.dart';

abstract class LogUtil {
  static void requestLog({
    String? method,
    int? statusCode,
    Map<String, dynamic>? response,
    String? uri,
    Map<String, dynamic>? request,
    Map<String, String>? headers,
  }) {
    Map<String, dynamic> logging = {};
    if (method != null) {
      logging['method'] = method;
    }
    if (statusCode != null) {
      logging['statusCode'] = statusCode;
    }
    if (response != null) {
      logging['response'] = response;
    }
    if (uri != null) {
      logging['uri'] = uri;
    }
    if (headers != null) {
      logging['headers'] = headers;
    }
    if (request != null) {
      logging['request'] = request;
    }
    debugPrint(logging.toString());
  }
}
