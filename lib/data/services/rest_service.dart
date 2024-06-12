import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../utils/app_storage.dart';
import '../../utils/log_util.dart';
import '../models/errors/http_errors.dart';
import 'service.dart';

class RestService implements IService {
  final AppStorage storage;

  RestService({required this.storage});

  @override
  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Map<String, String> finalHeaders = await _composeHeader(headers);
    Uri uri = await _composeUri(url);
    LogUtil.requestLog(
      method: 'DELETE',
      uri: uri.toString(),
      request: body,
      headers: finalHeaders,
    );
    http.Response response = await http.delete(
      uri,
      body: body,
      headers: finalHeaders,
    );
    return _processResponse(response);
  }

  @override
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    Map<String, String> finalHeaders = await _composeHeader(headers);
    Uri uri = await _composeUri(url);
    LogUtil.requestLog(
      method: 'GET',
      uri: uri.toString(),
      headers: finalHeaders,
    );
    http.Response response = await http.get(
      uri,
      headers: finalHeaders,
    );
    return _processResponse(response);
  }

  @override
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Map<String, String> finalHeaders = await _composeHeader(headers);
    Uri uri = await _composeUri(url);
    LogUtil.requestLog(
      method: 'POST',
      uri: uri.toString(),
      request: body,
      headers: finalHeaders,
    );
    http.Response response = await http.post(
      uri,
      body: body,
      headers: finalHeaders,
    );
    return _processResponse(response);
  }

  @override
  Future<Map<String, dynamic>> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Map<String, String> finalHeaders = await _composeHeader(headers);
    Uri uri = await _composeUri(url);
    LogUtil.requestLog(
      method: 'PUT',
      uri: uri.toString(),
      request: body,
      headers: finalHeaders,
    );
    http.Response response = await http.put(
      uri,
      body: body,
      headers: finalHeaders,
    );
    return _processResponse(response);
  }

  Future<Map<String, String>> _composeHeader(
    Map<String, String>? previousHeader,
  ) async {
    String? jwt = storage.getByKey('jwt');

    Map<String, String> headers = {};
    if (jwt != null) {
      headers['Authorization'] = jwt;
    }
    if (previousHeader != null) {
      headers.addAll(previousHeader);
    }
    return headers;
  }

  Future<Uri> _composeUri(String url) async {
    String baseUrl = dotenv.get('BASE_URL');
    return Uri.parse('$baseUrl$url');
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    int statusCode = response.statusCode;
    Map<String, dynamic>? responseBody = jsonDecode(response.body);
    LogUtil.requestLog(
      method: response.request?.method,
      uri: response.request?.url.toString(),
      response: responseBody,
    );

    if (statusCode > 300) {
      String message = responseBody?['message'] ?? 'Erro desconhecido';
      switch (statusCode) {
        case 401:
          throw UnauthorizedError(statusCode: statusCode, message: message);
        case 404:
          throw NotFoundError(statusCode: statusCode, message: message);
        case 400:
          throw BadRequestError(statusCode: statusCode, message: message);
        case 500:
          throw InternalServerError(statusCode: statusCode, message: message);
        case 403:
          throw ForbiddenError(statusCode: statusCode, message: message);
        case 409:
          throw ConflictError(statusCode: statusCode, message: message);
        case 504:
          throw GatewayTimeoutError(statusCode: statusCode, message: message);
        case 503:
          ServiceUnavailableError(statusCode: statusCode, message: message);
          break;
        default:
          InternalServerError(statusCode: statusCode, message: message);
      }
    }
    return responseBody?['data'] ?? <String, dynamic>{};
  }
}
