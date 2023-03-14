import 'package:dio/dio.dart';


class PlacesInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1IjoibHJvbWVybzI5IiwiYSI6ImNsZjg4eGtzbTF1ZWwzc280c29wZmdiZmcifQ.-6Kbhp0jW6q8xkLnK4ii0w';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es',
      'limit' : 7
    });


    super.onRequest(options, handler);
  }

}