import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:documentary_flix/modules/category/service/model/category_color_model.dart';
import 'package:documentary_flix/modules/category/service/model/category_extra_link_model.dart';
import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/category/category_store.dart';
import 'package:documentary_flix/modules/category/service/repository/category_repository.dart';

import 'package:documentary_flix/utils/color.dart';
import 'package:documentary_flix/utils/constants.dart';

import 'package:documentary_flix/shared/future_store.dart';

import 'package:documentary_flix/components/widgets/button.dart';
import 'package:documentary_flix/components/widgets/input_text.dart';

class FormCategory extends StatefulWidget {
  final Function onSuccess;
  final Function onError;
  final CategoryModel? category;

  const FormCategory({
    super.key,
    this.category,
    required this.onSuccess,
    required this.onError,
  });

  @override
  State<FormCategory> createState() => _FormCategoryState();
}

class _FormCategoryState extends State<FormCategory> {
  static const uuid = Uuid();
  CategoryStore categoryStore = CategoryStore(CategoryRepository());

  TextEditingController titleController = TextEditingController(),
      colorController = TextEditingController(),
      linkController = TextEditingController(),
      descriptionController = TextEditingController(),
      extraLinkController = TextEditingController(),
      extraTextController = TextEditingController();

  Future<CategoryModel?> validateCategoryModelFields() async {
    debugPrint('titleController ${titleController.text}');
    debugPrint('colorController ${colorController.text}');
    late String categoryId;

    if (widget.category != null) {
      bool titleHasNotEdited = titleController.text == widget.category!.title;
      bool colorHasNotEdited =
          colorController.text == widget.category!.color.toHex();

      bool linkHasNotEdited = linkController.text == widget.category!.link ||
          ((widget.category!.link == null || widget.category!.link!.isEmpty) &&
              linkController.text.isEmpty);
      bool descriptionHasNotEdited =
          descriptionController.text == widget.category!.description ||
              ((widget.category!.description == null ||
                      widget.category!.description!.isEmpty) &&
                  descriptionController.text.isEmpty);
      bool extraLinkHasNotEdited =
          extraLinkController.text == widget.category!.extraLink?.link ||
              ((widget.category!.extraLink?.link == null ||
                      widget.category!.extraLink!.link!.isEmpty) &&
                  extraLinkController.text.isEmpty);
      bool extraTextHasNotEdited =
          extraTextController.text == widget.category!.extraLink?.text ||
              ((widget.category!.extraLink?.text == null ||
                      widget.category!.extraLink!.text!.isEmpty) &&
                  extraTextController.text.isEmpty);

      if (titleHasNotEdited &&
          colorHasNotEdited &&
          linkHasNotEdited &&
          descriptionHasNotEdited &&
          extraLinkHasNotEdited &&
          extraTextHasNotEdited) {
        widget.onError(
            'É necessário alterar algum campo para atualizar a categoria');
        return null;
      }
      categoryId = widget.category!.id;
    } else {
      categoryId = uuid.v1();
    }

    if (titleController.text.isEmpty || colorController.text.isEmpty) {
      widget.onError('É necessário preencher o título e a cor');
      return null;
    }

    if (!hexColorRegex.hasMatch(colorController.text)) {
      widget.onError('Valor da cor em hexadecimal inválido');
      return null;
    }

    Color hexColor = ColorUtils.fromHex(colorController.text);
    CategoryColorModel color = CategoryColorModel(
      red: hexColor.red,
      green: hexColor.green,
      blue: hexColor.blue,
      opacity: hexColor.opacity,
      hexadecimal: '#${colorController.text}',
    );

    CategoryExtraLinkModel extraLink = CategoryExtraLinkModel(
      text: extraTextController.text,
      link: extraLinkController.text,
    );

    CategoryModel categoryModel = CategoryModel(
      id: categoryId,
      title: titleController.text,
      color: color,
      link: linkController.text,
      description: descriptionController.text,
      extraLink: extraLink,
    );

    return categoryModel;
  }

  onSaveCategory() async {
    await validateCategoryModelFields().then((categoryModel) async {
      if (categoryModel == null) return;

      await categoryStore.updateCategory(categoryModel);

      if (categoryStore.categoryFuture.errorMessage != null) {
        widget.onError('Erro ao atualizar categoria');
      }
      debugPrint('category ${categoryStore.categoryFuture.data?.toJson()}');
      if (categoryStore.categoryFuture.data != null &&
          categoryStore.categoryFuture.futureState == FutureState.loaded) {
        widget.onSuccess('Categoria salva com sucesso');
      }
    });
  }

  onCreateCategory() async {
    await validateCategoryModelFields().then((categoryModel) async {
      if (categoryModel == null) return;

      await categoryStore.createCategory(categoryModel);

      if (categoryStore.categoryFuture.errorMessage != null) {
        widget.onError('Erro ao criar categoria');
      }

      if (categoryStore.categoryFuture.data != null &&
          categoryStore.categoryFuture.futureState == FutureState.loaded) {
        widget.onSuccess('Categoria criada com sucesso');
      }
    });
  }

  onRemoveCategory() async {
    await categoryStore.deleteCategory(widget.category!.id);

    if (categoryStore.categoryFuture.errorMessage != null) {
      widget.onError('Erro ao deletar categoria');
    }

    if (categoryStore.deletedCategoryFuture.data == true &&
        categoryStore.deletedCategoryFuture.futureState == FutureState.loaded) {
      widget.onSuccess('Categoria deletada com sucesso');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditMode = widget.category != null;
    if (isEditMode) {
      titleController = TextEditingController(text: widget.category!.title);
      colorController = TextEditingController(
          text: widget.category!.color.hexadecimal.isNotEmpty
              ? widget.category!.color.toHex()
              : '');
      linkController = TextEditingController(text: widget.category!.link ?? '');
      descriptionController =
          TextEditingController(text: widget.category!.description ?? '');
      extraLinkController =
          TextEditingController(text: widget.category!.extraLink?.link ?? '');
      extraTextController =
          TextEditingController(text: widget.category!.extraLink?.text ?? '');
    }

    List<Widget> inputs = [
      InputText(
        label: 'Título*:',
        placeholder: 'Ex: Animais',
        controller: titleController,
      ),
      InputText(
        label: 'Cor (hexadecimal)*:',
        placeholder: 'Ex: #ffffff',
        max: 8,
        pattern: hexColorRegex,
        controller: colorController,
      ),
      InputText(
        label: 'Link (relacionado ao conteúdo  - opcional):',
        placeholder: 'Ex: https://www....',
        controller: linkController,
      ),
      InputText(
        label: 'Descrição (opcional):',
        placeholder: 'Ex: Este documentário fala sobre...',
        controller: descriptionController,
      ),
      InputText(
        label: 'Link extra (artigo relacionado - opcional):',
        placeholder: 'Ex: https://www....',
        controller: extraLinkController,
      ),
      InputText(
        label: 'Título do link extra (opcional):',
        placeholder: 'Ex: Como os animais...',
        controller: extraTextController,
      ),
    ];

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16, left: 36, right: 36),
              itemCount: inputs.length,
              itemBuilder: (BuildContext context, int index) => inputs[index],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
            child: Button(
              onPressed: isEditMode ? onSaveCategory : onCreateCategory,
              text: isEditMode ? 'Alterar' : 'Cadastrar',
            ),
          ),
          if (isEditMode)
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 16, left: 36, right: 36),
              child: Button(
                background: Theme.of(context).colorScheme.error,
                onPressed: onRemoveCategory,
                text: 'Remover',
              ),
            ),
        ],
      ),
    );
  }
}
