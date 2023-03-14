import 'package:dio/dio.dart';


class TrafficInterceptor extends Interceptor {

  final accessToken = 'pk.eyJ1IjoibHJvbWVybzI5IiwiYSI6ImNsZjg4eGtzbTF1ZWwzc280c29wZmdiZmcifQ.-6Kbhp0jW6q8xkLnK4ii0w';
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });


    super.onRequest(options, handler);
  }


}
