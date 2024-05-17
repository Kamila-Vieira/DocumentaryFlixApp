import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:documentary_flix/components/header.dart';
import 'package:documentary_flix/components/video_list.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/category/service/repository/category_repository.dart';
import 'package:documentary_flix/modules/category/category_store.dart';
import 'package:documentary_flix/modules/video/service/repository/video_repository.dart';
import 'package:documentary_flix/modules/video/video_store.dart';
import 'package:documentary_flix/modules/home/components/menu_navigate.dart';
import 'package:documentary_flix/modules/home/components/banner_highlight.dart';
import 'package:documentary_flix/modules/home/components/category_filter.dart';
import 'package:documentary_flix/modules/home/service/repository/home_repository.dart';
import 'package:documentary_flix/modules/home/home_store.dart';

import 'package:documentary_flix/shared/build_observable_future.dart';

import 'package:documentary_flix/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryStore _categoryStore = CategoryStore(CategoryRepository());
  final VideoStore _videoStore = VideoStore(VideoRepository());
  final HomeStore _homeStore = HomeStore(HomeRepository());

  void _handleSelectFilter(CategoryModel category) {
    _videoStore.listVideosByCategory(categoryId: category.id);
  }

  @override
  void initState() {
    _categoryStore.listCategories();
    _videoStore.listVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _categoryStore.listCategories();
          _videoStore.listVideos();
        },
        child: Column(
          children: [
            const Header(),
            const BannerHighlight(videoUrl: 'https://youtu.be/94yuIVdoevc'),
            Observer(
              builder: (_) => buildObservableFuture(
                resultComponent: CategoryFilter(
                  _homeStore.getCategoryFilters(
                    _categoryStore.listCategoriesFuture.data,
                    _handleSelectFilter,
                    _videoStore.listVideos,
                  ),
                ),
                futureStore: _categoryStore.listCategoriesFuture,
                emptyMessage: 'Categorias não encontradas',
                loadingMessage: 'Carregando categorias',
                errorMessage: 'Ocorreu um erro ao carregar as categorias',
              ),
            ),
            Observer(
              builder: (_) => buildObservableFuture(
                resultComponent: VideoList(
                  _videoStore.getVideoCards(
                    videos: _videoStore.listVideosFuture.data,
                    categories: _categoryStore.listCategoriesFuture.data,
                  ),
                ),
                futureStore: _videoStore.listVideosFuture,
                emptyMessage: 'Vídeos não encontrados',
                loadingMessage: 'Carregando videos',
                errorMessage: 'Ocorreu um erro ao carregar os videos',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton(
          onPressed: null,
          shape: const CircleBorder(side: BorderSide()),
          backgroundColor: ThemeColors.primaryColor,
          child: MenuNavigate(
            categories: _categoryStore.listCategoriesFuture.data ?? [],
          ),
        ),
      ),
    );
  }
}
