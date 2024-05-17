import 'package:dio/dio.dart';

import 'package:documentary_flix/shared/model_base.dart';
import 'package:documentary_flix/utils/dio_helper.dart';

class ApiService {
  final Dio _dio = DioHelper.instance;
  final String endpoint;

  ApiService({required this.endpoint});

  Future<Response> list(
      {String? search, int? page = 1, int? limit = 100}) async {
    Map<String, String> queryParameters = {};

    if (search != null && search.isNotEmpty) queryParameters['title'] = search;
    if (page != null) queryParameters['_page'] = '$page';
    if (limit != null) queryParameters['_per_page'] = '$limit';

    return _dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
  }

  Future<Response> search({
    required Map<String, String> params,
    int? page,
    int? limit,
  }) async {
    Map<String, String> queryParameters = params;

    if (page != null) queryParameters['_page'] = '$page';
    if (limit != null) queryParameters['_per_page'] = '$limit';

    return _dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
  }

  Future<Response> create(ModelBase model) async =>
      _dio.post(endpoint, data: model.toJson());

  Future<Response> update(ModelBase model) async =>
      _dio.put('$endpoint/${model.id}', data: model.toJson());

  Future<Response> findById(String id) async => _dio.get('$endpoint/$id');

  Future<Response> delete(String id) async => _dio.delete('$endpoint/$id');
}
