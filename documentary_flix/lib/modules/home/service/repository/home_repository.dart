import 'package:documentary_flix/modules/home/service/model/banner_model.dart';
import 'package:documentary_flix/shared/api_service.dart';

class HomeRepository {
  static ApiService? _service;

  static ApiService get _bannerService {
    _service ??= ApiService(endpoint: '/banner_highlight');
    return _service!;
  }

  Future<BannerModel> getBannerHighlight() async {
    var response = await _bannerService.search(params: {});
    return BannerModel.fromJson(response.data);
  }
}
