// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoStore on VideoStoreBase, Store {
  late final _$navigateToAtom =
      Atom(name: 'VideoStoreBase.navigateTo', context: context);

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

  late final _$listVideosFutureAtom =
      Atom(name: 'VideoStoreBase.listVideosFuture', context: context);

  @override
  FutureStore<List<VideoModel>> get listVideosFuture {
    _$listVideosFutureAtom.reportRead();
    return super.listVideosFuture;
  }

  @override
  set listVideosFuture(FutureStore<List<VideoModel>> value) {
    _$listVideosFutureAtom.reportWrite(value, super.listVideosFuture, () {
      super.listVideosFuture = value;
    });
  }

  late final _$videoFutureAtom =
      Atom(name: 'VideoStoreBase.videoFuture', context: context);

  @override
  FutureStore<VideoModel> get videoFuture {
    _$videoFutureAtom.reportRead();
    return super.videoFuture;
  }

  @override
  set videoFuture(FutureStore<VideoModel> value) {
    _$videoFutureAtom.reportWrite(value, super.videoFuture, () {
      super.videoFuture = value;
    });
  }

  late final _$deletedVideoFutureAtom =
      Atom(name: 'VideoStoreBase.deletedVideoFuture', context: context);

  @override
  FutureStore<bool> get deletedVideoFuture {
    _$deletedVideoFutureAtom.reportRead();
    return super.deletedVideoFuture;
  }

  @override
  set deletedVideoFuture(FutureStore<bool> value) {
    _$deletedVideoFutureAtom.reportWrite(value, super.deletedVideoFuture, () {
      super.deletedVideoFuture = value;
    });
  }

  late final _$listVideosAsyncAction =
      AsyncAction('VideoStoreBase.listVideos', context: context);

  @override
  Future<dynamic> listVideos({String? search, int? page, int? limit}) {
    return _$listVideosAsyncAction
        .run(() => super.listVideos(search: search, page: page, limit: limit));
  }

  late final _$listVideosByCategoryAsyncAction =
      AsyncAction('VideoStoreBase.listVideosByCategory', context: context);

  @override
  Future<dynamic> listVideosByCategory(
      {required String categoryId, int? page, int? limit}) {
    return _$listVideosByCategoryAsyncAction.run(() => super
        .listVideosByCategory(
            categoryId: categoryId, page: page, limit: limit));
  }

  late final _$getVideoByIdAsyncAction =
      AsyncAction('VideoStoreBase.getVideoById', context: context);

  @override
  Future<dynamic> getVideoById(String videoId) {
    return _$getVideoByIdAsyncAction.run(() => super.getVideoById(videoId));
  }

  late final _$createVideoAsyncAction =
      AsyncAction('VideoStoreBase.createVideo', context: context);

  @override
  Future<dynamic> createVideo(VideoModel video) {
    return _$createVideoAsyncAction.run(() => super.createVideo(video));
  }

  late final _$updateVideoAsyncAction =
      AsyncAction('VideoStoreBase.updateVideo', context: context);

  @override
  Future<dynamic> updateVideo(VideoModel video) {
    return _$updateVideoAsyncAction.run(() => super.updateVideo(video));
  }

  late final _$deleteVideoAsyncAction =
      AsyncAction('VideoStoreBase.deleteVideo', context: context);

  @override
  Future<dynamic> deleteVideo(String videoId) {
    return _$deleteVideoAsyncAction.run(() => super.deleteVideo(videoId));
  }

  @override
  String toString() {
    return '''
navigateTo: ${navigateTo},
listVideosFuture: ${listVideosFuture},
videoFuture: ${videoFuture},
deletedVideoFuture: ${deletedVideoFuture}
    ''';
  }
}
