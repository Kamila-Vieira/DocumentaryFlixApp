import 'package:documentary_flix/modules/video/service/model/video_model.dart';
import 'package:documentary_flix/shared/api_service.dart';

class VideoRepository {
  static ApiService? _service;

  static ApiService get _videoService {
    _service ??= ApiService(endpoint: '/videos');
    return _service!;
  }

  Future<List<VideoModel>> list({String? search, int? page, int? limit}) async {
    var response =
        await _videoService.list(search: search, limit: limit, page: page);
    return response.data
        .map<VideoModel>((video) => VideoModel.fromJson(video))
        .toList();
  }

  Future<VideoModel> createOne(VideoModel video) async {
    var response = await _videoService.create(video);
    return VideoModel.fromJson(response.data);
  }

  Future<VideoModel> updateOne(VideoModel video) async {
    var response = await _videoService.update(video);
    return VideoModel.fromJson(response.data);
  }

  Future<VideoModel> findById(String videoId) async {
    var response = await _videoService.findById(videoId);
    return VideoModel.fromJson(response.data);
  }

  Future<List<VideoModel>> findByCategoryId(
      {required String categoryId, int? page, int? limit}) async {
    var response = await _videoService
        .search(params: {'categoryId': categoryId}, limit: limit, page: page);
    return response.data
        .map<VideoModel>((video) => VideoModel.fromJson(video))
        .toList();
  }

  Future<bool> deleteOne(String videoId) async {
    var response = await _videoService.delete(videoId);
    return response.statusCode != null && response.statusCode! ~/ 100 == 2;
  }
}
