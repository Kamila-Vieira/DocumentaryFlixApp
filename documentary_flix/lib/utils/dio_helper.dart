import 'package:dio/dio.dart';
import 'package:documentary_flix/utils/constants.dart';

class DioHelper {
  static Dio? _instance;

  static Dio get instance {
    _instance ??= Dio(
      BaseOptions(
        baseUrl: apiUrl,
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 5),
      ),
    )..interceptors.add(LogInterceptor(
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        request: true));

    return _instance!;
  }
}
