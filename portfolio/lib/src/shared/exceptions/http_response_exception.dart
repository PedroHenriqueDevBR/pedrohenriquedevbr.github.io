import 'package:portfolio/src/shared/models/http_response_model.dart';

class HttpResponseException implements Exception {
  HttpResponseModel response;
  HttpResponseException({
    required this.response,
  });
}
