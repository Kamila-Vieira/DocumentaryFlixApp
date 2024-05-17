import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/modules/category/category_module.dart';
import 'package:documentary_flix/modules/video/video_module.dart';
import 'package:documentary_flix/modules/home/home_module.dart';

class AppModule extends Module {
  static final homeRoute = Modular.initialRoute;
  static const categoryRoute = '/category/';
  static const videoRoute = '/video/';

  @override
  List<Bind> binds = [];

  @override
  List<ModularRoute> routes = [
    ModuleRoute(homeRoute, module: HomeModule()),
    ModuleRoute(categoryRoute, module: CategoryModule()),
    ModuleRoute(videoRoute, module: VideoModule()),
  ];
}
