import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/modules/category/category_store.dart';
import 'package:documentary_flix/modules/video/video_store.dart';
import 'package:documentary_flix/modules/home/home_store.dart';
import 'package:documentary_flix/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> binds = [
    Bind((i) => HomeStore.new),
    Bind((i) => CategoryStore.new),
    Bind((i) => VideoStore.new),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage())
  ];
}
