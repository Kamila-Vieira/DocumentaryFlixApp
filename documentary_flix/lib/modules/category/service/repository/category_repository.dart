import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/shared/api_service.dart';

class CategoryRepository {
  static ApiService? _service;

  static ApiService get _categoryService {
    _service ??= ApiService(endpoint: '/categories');
    return _service!;
  }

  Future<List<CategoryModel>> list(
      {String? search, int? page, int? limit}) async {
    var response =
        await _categoryService.list(search: search, limit: limit, page: page);
    return response.data
        .map<CategoryModel>((category) => CategoryModel.fromJson(category))
        .toList();
  }

  Future<CategoryModel> createOne(CategoryModel category) async {
    var response = await _categoryService.create(category);
    return CategoryModel.fromJson(response.data);
  }

  Future<CategoryModel> updateOne(CategoryModel category) async {
    var response = await _categoryService.update(category);
    return CategoryModel.fromJson(response.data);
  }

  Future<CategoryModel> findById(String categoryId) async {
    var response = await _categoryService.findById(categoryId);
    return CategoryModel.fromJson(response.data);
  }

  Future<bool> deleteOne(String categoryId) async {
    var response = await _categoryService.delete(categoryId);
    return response.statusCode != null && response.statusCode! ~/ 100 == 2;
  }
}
