// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on CategoryStoreBase, Store {
  late final _$navigateToAtom =
      Atom(name: 'CategoryStoreBase.navigateTo', context: context);

  @override
  String get navigateTo {
    _$navigateToAtom.reportRead();
    return super.navigateTo;
  }

  @override
  set navigateTo(String value) {
    _$navigateToAtom.reportWrite(value, super.navigateTo, () {
      super.navigateTo = value;
    });
  }

  late final _$listCategoriesFutureAtom =
      Atom(name: 'CategoryStoreBase.listCategoriesFuture', context: context);

  @override
  FutureStore<List<CategoryModel>> get listCategoriesFuture {
    _$listCategoriesFutureAtom.reportRead();
    return super.listCategoriesFuture;
  }

  @override
  set listCategoriesFuture(FutureStore<List<CategoryModel>> value) {
    _$listCategoriesFutureAtom.reportWrite(value, super.listCategoriesFuture,
        () {
      super.listCategoriesFuture = value;
    });
  }

  late final _$categoryFutureAtom =
      Atom(name: 'CategoryStoreBase.categoryFuture', context: context);

  @override
  FutureStore<CategoryModel> get categoryFuture {
    _$categoryFutureAtom.reportRead();
    return super.categoryFuture;
  }

  @override
  set categoryFuture(FutureStore<CategoryModel> value) {
    _$categoryFutureAtom.reportWrite(value, super.categoryFuture, () {
      super.categoryFuture = value;
    });
  }

  late final _$deletedCategoryFutureAtom =
      Atom(name: 'CategoryStoreBase.deletedCategoryFuture', context: context);

  @override
  FutureStore<bool> get deletedCategoryFuture {
    _$deletedCategoryFutureAtom.reportRead();
    return super.deletedCategoryFuture;
  }

  @override
  set deletedCategoryFuture(FutureStore<bool> value) {
    _$deletedCategoryFutureAtom.reportWrite(value, super.deletedCategoryFuture,
        () {
      super.deletedCategoryFuture = value;
    });
  }

  late final _$listCategoriesAsyncAction =
      AsyncAction('CategoryStoreBase.listCategories', context: context);

  @override
  Future<dynamic> listCategories({String? search, int? page, int? limit}) {
    return _$listCategoriesAsyncAction.run(
        () => super.listCategories(search: search, page: page, limit: limit));
  }

  late final _$getCategoryByIdAsyncAction =
      AsyncAction('CategoryStoreBase.getCategoryById', context: context);

  @override
  Future<dynamic> getCategoryById(String categoryId) {
    return _$getCategoryByIdAsyncAction
        .run(() => super.getCategoryById(categoryId));
  }

  late final _$createCategoryAsyncAction =
      AsyncAction('CategoryStoreBase.createCategory', context: context);

  @override
  Future<dynamic> createCategory(CategoryModel category) {
    return _$createCategoryAsyncAction
        .run(() => super.createCategory(category));
  }

  late final _$updateCategoryAsyncAction =
      AsyncAction('CategoryStoreBase.updateCategory', context: context);

  @override
  Future<dynamic> updateCategory(CategoryModel category) {
    return _$updateCategoryAsyncAction
        .run(() => super.updateCategory(category));
  }

  late final _$deleteCategoryAsyncAction =
      AsyncAction('CategoryStoreBase.deleteCategory', context: context);

  @override
  Future<dynamic> deleteCategory(String categoryId) {
    return _$deleteCategoryAsyncAction
        .run(() => super.deleteCategory(categoryId));
  }

  @override
  String toString() {
    return '''
navigateTo: ${navigateTo},
listCategoriesFuture: ${listCategoriesFuture},
categoryFuture: ${categoryFuture},
deletedCategoryFuture: ${deletedCategoryFuture}
    ''';
  }
}
