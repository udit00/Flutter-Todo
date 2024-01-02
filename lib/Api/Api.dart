import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  String appName = "todo";
  String baseUrl = "";
  Api() {
    // baseUrl =  "https://udit.apipadhai.com/$appName/";
    baseUrl =  "http://localhost:5000/$appName/";
  }
  Future<http.Response> apiGet(String apiName, Map<String, String> params) {
    String url = "$baseUrl$apiName?";
    params.forEach((key, value) { 
      url += "$key=$value&";
    });
    String finalUrl = url.substring(0, url.lastIndexOf("&"));
    return http.get(Uri.parse(finalUrl));
  }

  Future<http.Response> apiPost(String apiName, Map<String, String> params) {
    String url = "$baseUrl$apiName";
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(params),
    );
  }
}