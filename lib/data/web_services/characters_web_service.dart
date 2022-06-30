import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:posts/core/api/app_interceptors.dart';
import 'package:posts/core/api/end_points.dart';
import 'package:posts/injection_container.dart' as di;

class CharactersWebService {
  late Dio dio;

  CharactersWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);

    dio.interceptors.add(di.serviceLocator<AppInterceptors>());
    if (kDebugMode) {
      dio.interceptors.add(di.serviceLocator<LogInterceptor>());
    }
  }

  Future<dynamic> getAllCharacters() async {
    try {
      Response response = await dio.get(EndPoints.baseUrl);
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
