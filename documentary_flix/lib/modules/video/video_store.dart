import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/components/video_card.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/video/service/model/video_model.dart';
import 'package:documentary_flix/modules/video/service/repository/video_repository.dart';

import 'package:documentary_flix/shared/future_store.dart';

import 'package:documentary_flix/app_module.dart';

part 'video_store.g.dart';

class VideoStore = VideoStoreBase with _$VideoStore;

abstract class VideoStoreBase with Store {
  final VideoRepository _videoRepository;

  VideoStoreBase(this._videoRepository);

  @observable
  String navigateTo = AppModule.homeRoute;

  @observable
  FutureStore<List<VideoModel>> listVideosFuture =
      FutureStore<List<VideoModel>>();

  @observable
  FutureStore<VideoModel> videoFuture = FutureStore<VideoModel>();

  @observable
  FutureStore<bool> deletedVideoFuture = FutureStore<bool>();

  List<VideoCard> getVideoCards({
    List<VideoModel>? videos,
    List<CategoryModel>? categories,
    CategoryModel? category,
  }) {
    if (videos == null) return [];

    List<VideoCard> videoCards = [];

    for (var video in videos) {
      CategoryModel? videoCategory = category ??
          categories?.firstWhere((category) => category.id == video.categoryId);

      if (videoCategory != null) {
        videoCards.add(VideoCard(
          videoUrl: video.url,
          videoTitle: video.title,
          categoryTitle: videoCategory.title,
          categoryColor: videoCategory.color.toColor(),
          onCategoryPress: () {
            Modular.to.navigate(
              AppModule.categoryRoute,
              arguments: {
                'categoryId': videoCategory.id,
              },
            );
          },
          onEditVideo: () {
            Modular.to.navigate(
              AppModule.videoRoute,
              arguments: {
                'categories': categories,
                'videoId': video.id,
              },
            );
          },
        ));
      }
    }
    return videoCards;
  }

  @action
  Future listVideos({String? search, int? page, int? limit}) async {
    try {
      listVideosFuture.errorMessage = null;

      listVideosFuture.future = ObservableFuture(
          _videoRepository.list(search: search, limit: limit, page: page));

      listVideosFuture.data = await listVideosFuture.future;
    } catch (error) {
      debugPrint('$error');
      listVideosFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }

  @action
  Future listVideosByCategory(
      {required String categoryId, int? page, int? limit}) async {
    try {
      listVideosFuture.errorMessage = null;

      listVideosFuture.future = ObservableFuture(_videoRepository
          .findByCategoryId(categoryId: categoryId, limit: limit, page: page));

      listVideosFuture.data = await listVideosFuture.future;
    } catch (error) {
      listVideosFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }

  @action
  Future getVideoById(String videoId) async {
    try {
      videoFuture.data = null;
      videoFuture.errorMessage = null;

      videoFuture.future = ObservableFuture(_videoRepository.findById(videoId));

      videoFuture.data = await videoFuture.future;
    } catch (error) {
      videoFuture.errorMessage = error is DioException && error.message != null
          ? error.message
          : error.toString();
    }
  }

  @action
  Future createVideo(VideoModel video) async {
    try {
      videoFuture.data = null;
      videoFuture.errorMessage = null;

      videoFuture.future = ObservableFuture(_videoRepository.createOne(video));

      videoFuture.data = await videoFuture.future;
    } catch (error) {
      videoFuture.errorMessage = error is DioException && error.message != null
          ? error.message
          : error.toString();
    }
  }

  @action
  Future updateVideo(VideoModel video) async {
    try {
      videoFuture.data = null;
      videoFuture.errorMessage = null;

      videoFuture.future = ObservableFuture(_videoRepository.updateOne(video));

      videoFuture.data = await videoFuture.future;
    } catch (error) {
      videoFuture.errorMessage = error is DioException && error.message != null
          ? error.message
          : error.toString();
    }
  }

  @action
  Future deleteVideo(String videoId) async {
    try {
      deletedVideoFuture.errorMessage = null;

      deletedVideoFuture.future =
          ObservableFuture(_videoRepository.deleteOne(videoId));

      deletedVideoFuture.data = await deletedVideoFuture.future;
    } catch (error) {
      deletedVideoFuture.errorMessage =
          error is DioException && error.message != null
              ? error.message
              : error.toString();
    }
  }
}
