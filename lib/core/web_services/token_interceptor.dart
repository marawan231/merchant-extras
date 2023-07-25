import 'package:dio/dio.dart';
import '../resources/constants.dart';

class TokenIntereceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (token != null) {
      options.headers['authorization'] = 'Bearer $token';
    }
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}
