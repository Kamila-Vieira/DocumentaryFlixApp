import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/video/video_store.dart';
import 'package:documentary_flix/modules/video/service/repository/video_repository.dart';

import 'package:documentary_flix/components/video_list.dart';

import 'package:documentary_flix/shared/build_observable_future.dart';

class CategoryPreview extends StatefulWidget {
  final CategoryModel category;
  const CategoryPreview({super.key, required this.category});

  @override
  State<CategoryPreview> createState() => _CategoryPreviewState();
}

class _CategoryPreviewState extends State<CategoryPreview> {
  final VideoStore _videoStore = VideoStore(VideoRepository());

  @override
  void initState() {
    _videoStore.listVideosByCategory(categoryId: widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) => buildObservableFuture(
              resultComponent: VideoList(
                _videoStore.getVideoCards(
                  videos: _videoStore.listVideosFuture.data,
                  category: widget.category,
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
    );
  }
}
