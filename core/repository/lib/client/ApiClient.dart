import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  String apiToken;
  final String host;
  final String path;
  final http.Client httpClient;
  final Function logoutFunction;

  ApiClient({
    this.apiToken,
    @required this.host,
    this.path = '',
    this.httpClient,
    this.logoutFunction,
  });

  final _baseHeaders = {
    'X-App-Name': 'App Name',
    'Content-Type': 'application/json; charset=utf-8',
  };

  void updateApiToken(String token) {
    this.apiToken = token;
  }

  Map<String, String> _headers(Map<String, String> extraHeaders) {
    var headers = Map<String, String>.from(_baseHeaders);

    if (apiToken != null) {
      headers['Authorization'] = 'Token token="$apiToken"';
    }

    if (extraHeaders != null) {
      headers.addAll(extraHeaders);
    }

    return headers;
  }

  Future<T> _request<T>({
    String verb,
    String url,
    String path,
    Map<String, String> extraHeaders,
    Map<String, dynamic> params,
    Map<String, String> queryParams,
    T parse(Map<String, dynamic> json),
    T parseList(List<dynamic> jsonList),
    Function(Map<String, dynamic> json) preparse,
  }) async {
    var uri = Uri.parse(url ?? '$host$path');
    if (verb == 'GET') {
      uri = Uri.https(uri.authority, uri.path,
          uri.hasQuery ? uri.queryParameters : queryParams);
    }
    final req = http.Request(verb, uri);
    req.headers.addAll(_headers(extraHeaders));

    req.body = jsonEncode(params);
    return httpRequest(
      req: req,
      parse: parse,
      parseList: parseList,
      preparse: preparse,
    );
  }

  Future<T> httpRequest<T>({
    http.Request req,
    T parse(Map<String, dynamic> json),
    T parseList(List<dynamic> jsonList),
    Function(Map<String, dynamic> json) preparse,
  }) async {
    final response = await httpClient.send(req);
    final responseBody = await response.stream.bytesToString();

    debugPrint(
      'HTTP request [${response.statusCode}]: ${req.url} (${req.body})',
    );
    debugPrint('Response Body: $responseBody');

    if (!_isSuccessful(response)) {
      var errorJson = responseBody.isEmpty
          ? {'error': 'Oops! Something went wrong.'}
          : jsonDecode(responseBody);

      if (response.statusCode == 401) {
        await logoutFunction.call();
      }

      throw Exception(errorJson);
    }

    if (T is Empty || responseBody.isEmpty) {
      return null;
    }

    final jsonBody = jsonDecode(responseBody);
    if (preparse != null) preparse(jsonBody);

    return parse != null ? parse(jsonBody) : parseList?.call(jsonBody);
  }

  Future<T> get<T>({
    String path,
    Map<String, String> extraHeaders,
    Map<String, String> queryParams,
    T parse(Map<String, dynamic> json),
    T parseList(List<dynamic> jsonList),
    Function(Map<String, dynamic> json) preparse,
  }) {
    return _request(
      verb: 'GET',
      path: path,
      extraHeaders: extraHeaders,
      queryParams: queryParams,
      parse: parse,
      parseList: parseList,
      preparse: preparse,
    );
  }

  Future<T> post<T>({
    String path,
    String url,
    Map<String, String> extraHeaders,
    Map<String, dynamic> params,
    T parse(Map<String, dynamic> json),
    T parseList(List<dynamic> jsonList),
    Function(Map<String, dynamic> json) preparse,
  }) {
    return _request(
      verb: 'POST',
      url: url,
      path: path,
      extraHeaders: extraHeaders,
      params: params,
      parse: parse,
      parseList: parseList,
      preparse: preparse,
    );
  }

  Future<void> delete({
    String path,
    Map<String, String> extraHeaders,
    Map<String, dynamic> params,
    Function(Map<String, dynamic> json) preparse,
  }) {
    return _request<Empty>(
      verb: 'DELETE',
      path: path,
      extraHeaders: extraHeaders,
      params: params,
      preparse: preparse,
    );
  }

  Future<T> patch<T>({
    String path,
    Map<String, String> extraHeaders,
    Map<String, dynamic> params,
    T parse(Map<String, dynamic> json),
    T parseList(List<dynamic> jsonList),
    Function(Map<String, dynamic> json) preparse,
  }) {
    return _request(
      verb: 'PATCH',
      path: path,
      extraHeaders: extraHeaders,
      params: params,
      parse: parse,
      parseList: parseList,
      preparse: preparse,
    );
  }

  Future<T> put<T>({
    String path,
    Map<String, String> extraHeaders,
    Map<String, dynamic> params,
    T parse(Map<String, dynamic> json),
    T parseList(List<dynamic> jsonList),
    Function(Map<String, dynamic> json) preparse,
  }) {
    return _request(
      verb: 'PUT',
      path: path,
      extraHeaders: extraHeaders,
      params: params,
      parse: parse,
      parseList: parseList,
      preparse: preparse,
    );
  }

  bool _isSuccessful(http.StreamedResponse response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}

class Empty {}
