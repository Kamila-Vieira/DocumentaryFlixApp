import 'package:flutter_modular/flutter_modular.dart';
import 'package:documentary_flix/modules/category/category_store.dart';
import 'package:documentary_flix/modules/video/video_page.dart';
import 'package:documentary_flix/modules/video/video_store.dart';

class VideoModule extends Module {
  @override
  List<Bind> binds = [
    Bind((i) => VideoStore.new),
    Bind((i) => CategoryStore.new),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => VideoPage(
        categories: args.data?['categories'] ?? [],
        videoId: args.data?['videoId'],
      ),
    )
  ];
}
