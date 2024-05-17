import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/modules/category/category_page.dart';
import 'package:documentary_flix/modules/category/category_store.dart';
import 'package:documentary_flix/modules/video/video_store.dart';

class CategoryModule extends Module {
  @override
  List<Bind> binds = [
    Bind((i) => CategoryStore.new),
    Bind((i) => VideoStore.new),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => CategoryPage(
        categoryId: args.data?['categoryId'],
      ),
    )
  ];
}
