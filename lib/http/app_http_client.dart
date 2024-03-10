import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mauritius_power_app/http/app_http_request.dart';
import 'package:mauritius_power_app/http/app_http_response.dart';

class AppHttpClient {
  final String defaultBaseUrl;
  final http.Client client;
  final bool useHttps;

  AppHttpClient({required this.defaultBaseUrl, this.useHttps = true})
      : client = http.Client();

  AppHttpClient.withCustomClient({
    required this.defaultBaseUrl,
    required this.client,
    this.useHttps = true,
  });

  Future<AppHttpResponse> get(AppHttpRequest request) async {
    try {
      final baseUri = request.customBaseUrl ?? defaultBaseUrl;

      final uri = useHttps
          ? Uri.https(baseUri, request.url)
          : Uri.http(baseUri, request.url);

      final response = await client.get(uri);

      final decodedJson = json.decode(response.body);

      return AppHttpResponse.success(decodedJson: decodedJson);
    } catch (e) {
      log(e.toString());

      return AppHttpResponse.failed();
    }
  }
}
