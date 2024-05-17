import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:documentary_flix/components/tag_filter.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/home/service/repository/home_repository.dart';

import 'package:documentary_flix/shared/future_store.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _homeRepository;

  HomeStoreBase(this._homeRepository);

  @observable
  FutureStore<String> bannerFuture = FutureStore<String>();

  @action
  Future getBannerHighlight() async {
    try {
      bannerFuture.data = null;
      bannerFuture.errorMessage = null;

      bannerFuture.future =
          ObservableFuture(_homeRepository.getBannerHighlight());

      bannerFuture.data = await bannerFuture.future;
    } catch (error) {
      bannerFuture.errorMessage = error is DioException && error.message != null
          ? error.message
          : error.toString();
    }
  }

  List<TagFilter> getCategoryFilters(
    List<CategoryModel>? categories,
    Function handleSelectFilter,
    Function() loadAllVideos,
  ) {
    List<TagFilter> list = [
      TagFilter(
        title: 'Todas',
        color: Colors.orange,
        onPressed: loadAllVideos,
      )
    ];
    if (categories != null) {
      for (var category in categories) {
        list.add(TagFilter(
          title: category.title,
          color: category.color.toColor(),
          onPressed: () => handleSelectFilter(category),
        ));
      }
    }

    return list;
  }
}
