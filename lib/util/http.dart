import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class HttpClient {
  // Setup a singleton
  static final HttpClient _httpClient = HttpClient._internal();
  factory HttpClient() {
    return _httpClient;
  }
  HttpClient._internal();

  static String baseUrl(String subEndpoint) =>
      "http://newsapi.org/v2/$subEndpoint&apiKey=47d9b86a629048a1aaf1d8f1d95510da";

  Future<http.Response> getRequest(String endpoint) async {
    try {
      http.Response response = await http.Client().get(
        baseUrl(endpoint),
      );
      debugPrint("getRequest:\nurl:$endpoint\nresponse:\n$response");
      return response;
    } catch (e) {
      debugPrint(e);
      throw e;
    }
  }

  Future<http.Response> postRequest(
    String endpoint,
    Map<dynamic, String> body,
  ) async {
    try {
      http.Response response = await http.Client().post(
        baseUrl("todo"),
        body: body,
      );
      debugPrint("postRequest:\nurl:$endpoint\nresponse:\n$response");
      return response;
    } catch (e) {
      debugPrint(e);
      throw e;
    }
  }
}
