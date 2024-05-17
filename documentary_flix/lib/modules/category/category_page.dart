import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/components/header.dart';
import 'package:documentary_flix/components/tag_filter.dart';
import 'package:documentary_flix/components/widgets/button.dart';

import 'package:documentary_flix/modules/category/components/category_preview.dart';
import 'package:documentary_flix/modules/category/components/form_category.dart';
import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/category/service/repository/category_repository.dart';
import 'package:documentary_flix/modules/video/service/repository/video_repository.dart';
import 'package:documentary_flix/modules/video/video_store.dart';

import 'package:documentary_flix/shared/future_store.dart';
import 'package:documentary_flix/shared/snackbar_notification.dart';

import 'package:documentary_flix/themes/colors.dart';
import 'package:documentary_flix/utils/color.dart';

import 'category_store.dart';

class CategoryPage extends StatefulWidget {
  final String? categoryId;
  const CategoryPage({super.key, this.categoryId});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final VideoStore _videoStore = VideoStore(VideoRepository());
  final CategoryStore _categoryStore = CategoryStore(CategoryRepository());
  CategoryModel? selectedCategory;
  bool showCategoryPreview = true;
  bool isEditMode = false;

  Future<void> getCategoryToEdit() async {
    if (widget.categoryId != null) {
      await _categoryStore.getCategoryById(widget.categoryId!);
      var category = _categoryStore.categoryFuture.data;

      if (_categoryStore.categoryFuture.errorMessage != null) {
        SnackBarNotification.error(
          // ignore: use_build_context_synchronously
          context,
          'Ocorreu um erro ao tentar resgatar a categoria',
        );
      }

      if (category == null &&
          _categoryStore.categoryFuture.futureState == FutureState.loaded) {
        return;
      }

      setState(() {
        selectedCategory = category;
      });
    }
  }

  @override
  void initState() {
    getCategoryToEdit();

    isEditMode = widget.categoryId != null;

    if (widget.categoryId != null && showCategoryPreview) {
      _videoStore.listVideosByCategory(categoryId: widget.categoryId!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.all(36),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isEditMode ? 'Categoria: ' : 'Cadastre uma categoria',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (isEditMode && selectedCategory != null)
                  TagFilter(
                    title: selectedCategory!.title,
                    color: ColorUtils.toColor(selectedCategory!.color.toJson()),
                  ),
              ],
            ),
          ),
          if (isEditMode)
            Padding(
              padding: const EdgeInsets.only(left: 36, right: 36, bottom: 32),
              child: Button(
                text: showCategoryPreview
                    ? 'Editar Categoria'
                    : 'Preview da categoria',
                onPressed: () {
                  setState(() {
                    showCategoryPreview = !showCategoryPreview;
                  });
                },
              ),
            ),
          if (isEditMode && showCategoryPreview && selectedCategory != null)
            CategoryPreview(category: selectedCategory!)
          else
            FormCategory(
              category: selectedCategory,
              onSuccess: (message) {
                SnackBarNotification.success(context, message);
                Modular.to.navigate(_categoryStore.navigateTo);
              },
              onError: (message) {
                SnackBarNotification.error(context, message);
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide()),
        backgroundColor: ThemeColors.primaryColor,
        onPressed: () {
          Modular.to.navigate(_categoryStore.navigateTo);
        },
        child: const Icon(Icons.home, size: 38, color: ThemeColors.iconColor),
      ),
    );
  }
}
