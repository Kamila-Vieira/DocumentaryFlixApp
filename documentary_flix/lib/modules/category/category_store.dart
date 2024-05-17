import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'package:documentary_flix/app_module.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/category/service/repository/category_repository.dart';

import 'package:documentary_flix/shared/future_store.dart';

part 'category_store.g.dart';

class CategoryStore = CategoryStoreBase with _$CategoryStore;

abstract class CategoryStoreBase with Store {
  final CategoryRepository _categoryRepository;

  CategoryStoreBase(this._categoryRepository);

  @observable
  String navigateTo = AppModule.homeRoute;

  @observable
  FutureStore<List<CategoryModel>> listCategoriesFuture =
      FutureStore<List<CategoryModel>>();

  @observable
  FutureStore<CategoryModel> categoryFuture = FutureStore<CategoryModel>();

  @observable
  FutureStore<bool> deletedCategoryFuture = FutureStore<bool>();

  @action
  Future listCategories({String? search, int? page, int? limit}) async {
    try {
      listCategoriesFuture.errorMessage = null;

      listCategoriesFuture.future = ObservableFuture(
          _categoryRepository.list(search: search, limit: limit, page: page));

      listCategoriesFuture.data = await listCategoriesFuture.future;
    } catch (error) {
      listCategoriesFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }

  @action
  Future getCategoryById(String categoryId) async {
    try {
      categoryFuture.data = null;
      categoryFuture.errorMessage = null;

      categoryFuture.future =
          ObservableFuture(_categoryRepository.findById(categoryId));

      categoryFuture.data = await categoryFuture.future;
    } catch (error) {
      categoryFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }

  @action
  Future createCategory(CategoryModel category) async {
    try {
      categoryFuture.data = null;
      categoryFuture.errorMessage = null;

      categoryFuture.future =
          ObservableFuture(_categoryRepository.createOne(category));

      categoryFuture.data = await categoryFuture.future;
    } catch (error) {
      categoryFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }

  @action
  Future updateCategory(CategoryModel category) async {
    try {
      categoryFuture.data = null;
      categoryFuture.errorMessage = null;

      categoryFuture.future =
          ObservableFuture(_categoryRepository.updateOne(category));

      categoryFuture.data = await categoryFuture.future;
    } catch (error) {
      categoryFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }

  @action
  Future deleteCategory(String categoryId) async {
    try {
      deletedCategoryFuture.errorMessage = null;

      deletedCategoryFuture.future =
          ObservableFuture(_categoryRepository.deleteOne(categoryId));

      deletedCategoryFuture.data = await deletedCategoryFuture.future;
    } catch (error) {
      deletedCategoryFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }
}
