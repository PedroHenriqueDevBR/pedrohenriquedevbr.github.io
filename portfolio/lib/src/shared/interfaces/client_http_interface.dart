import '../models/http_response_model.dart';

abstract class IClientHTTP {
  Future<HttpResponseModel> get(String url);

  Future<HttpResponseModel> post(String url, Map<String, dynamic> data);
}
