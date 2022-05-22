class HttpResponseModel {
  int statusCode;
  dynamic data;
  Map<String, dynamic>? headers;

  HttpResponseModel({
    required this.statusCode,
    this.data,
    this.headers,
  });
}
