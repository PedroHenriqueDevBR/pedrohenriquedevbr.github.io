import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/http_response_model.dart';
import '../interfaces/client_http_interface.dart';

class HttpClientService implements IClientHTTP {
  Uri _getBaseUrl(String path) => Uri.parse(path);

  Map<String, String> _setAuthorization({String? key}) {
    Map<String, String> map = {};
    map['Content-Type'] = 'application/json';
    if (key != null) {
      map['Authorization'] = 'Bearer $key';
    }
    return map;
  }

  @override
  Future<HttpResponseModel> get(String url) async {
    final uri = _getBaseUrl(url);
    try {
      Response response = await http.get(uri);
      return HttpResponseModel(
        statusCode: response.statusCode,
        data: jsonDecode(
            response.body.isNotEmpty ? utf8.decode(response.bodyBytes) : '{}'),
        headers: response.headers,
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseModel> post(
    String url,
    Map<String, dynamic> data,
  ) async {
    final uri = _getBaseUrl(url);
    try {
      Response response = await http.post(uri, body: jsonEncode(data));
      return HttpResponseModel(
        statusCode: response.statusCode,
        data: json.decode(
          utf8.decode(response.body.isNotEmpty
              ? response.body.codeUnits
              : '{}'.codeUnits),
        ),
        headers: response.headers,
      );
    } catch (error) {
      rethrow;
    }
  }
}
