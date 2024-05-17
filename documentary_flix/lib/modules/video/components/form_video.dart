import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:documentary_flix/components/video_card.dart';
import 'package:documentary_flix/components/widgets/button.dart';
import 'package:documentary_flix/components/widgets/input_dropdown.dart';
import 'package:documentary_flix/components/widgets/input_text.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/video/service/model/video_model.dart';
import 'package:documentary_flix/modules/video/service/repository/video_repository.dart';
import 'package:documentary_flix/modules/video/video_store.dart';

import 'package:documentary_flix/shared/future_store.dart';
import 'package:documentary_flix/utils/youtube.dart';

class FormVideo extends StatefulWidget {
  final List<CategoryModel> categories;
  final Function(String) onSuccess;
  final Function(String) onError;
  final String? videoId;

  const FormVideo({
    super.key,
    this.videoId,
    required this.categories,
    required this.onSuccess,
    required this.onError,
  });

  @override
  State<FormVideo> createState() => _FormVideoState();
}

class _FormVideoState extends State<FormVideo> {
  static const uuid = Uuid();
  VideoStore videoStore = VideoStore(VideoRepository());
  bool showPreview = false;

  late TextEditingController videoIdController = TextEditingController(),
      titleController = TextEditingController(),
      descriptionController = TextEditingController();
  CategoryModel? selectedCategory;
  VideoModel? selectedVideo;

  @override
  initState() {
    getVideoToEdit();
    super.initState();
  }

  getVideoToEdit() async {
    if (widget.videoId != null) {
      await videoStore.getVideoById(widget.videoId!);
      var video = videoStore.videoFuture.data;

      if (videoStore.videoFuture.errorMessage != null) {
        widget.onError('Ocorreu um erro ao resgatar o vídeo');
      }

      if (video == null &&
          videoStore.videoFuture.futureState == FutureState.loaded) return;

      setState(() {
        selectedVideo = video;
        selectedCategory = widget.categories.firstWhere(
          (element) => video != null && element.id == video.categoryId,
        );
        showPreview = selectedVideo != null &&
            selectedVideo!.url.isNotEmpty &&
            selectedVideo!.title.isNotEmpty &&
            selectedCategory != null;
      });
    }
  }

  Future<VideoModel?> validateVideoModelFields() async {
    late String videoId;

    if (selectedVideo != null) {
      if (titleController.text == selectedVideo!.title &&
          videoIdController.text == getVideoId(selectedVideo!.url) &&
          selectedCategory?.id == selectedVideo?.categoryId) {
        widget
            .onError('É necessário alterar algum campo para atualizar o vídeo');
        return null;
      }
      videoId = widget.videoId!;
    } else {
      videoId = uuid.v1();
    }

    if (titleController.text.isEmpty ||
        videoIdController.text.isEmpty ||
        selectedCategory == null) {
      widget.onError('É necessário preencher todos os campos');
      return null;
    }

    VideoModel videoModel = VideoModel(
      id: videoId,
      title: titleController.text,
      categoryId: selectedCategory!.id,
      url: getVideoUrl(videoIdController.text),
      description: descriptionController.text.isNotEmpty
          ? descriptionController.text
          : null,
    );

    return videoModel;
  }

  onSaveVideo() async {
    await validateVideoModelFields().then((videoModel) async {
      if (videoModel == null) return;

      await videoStore.updateVideo(videoModel);

      if (videoStore.videoFuture.errorMessage != null) {
        widget.onError('Erro ao atualizar vídeo');
      }

      if (videoStore.videoFuture.data != null &&
          videoStore.videoFuture.futureState == FutureState.loaded) {
        widget.onSuccess('Vídeo salvo com sucesso');
      }
    });
  }

  onCreateVideo() async {
    await validateVideoModelFields().then((videoModel) async {
      if (videoModel == null) return;

      await videoStore.createVideo(videoModel);

      if (videoStore.videoFuture.errorMessage != null) {
        widget.onError('Erro ao cadastrar vídeo');
      }

      if (videoStore.videoFuture.data != null &&
          videoStore.videoFuture.futureState == FutureState.loaded) {
        widget.onSuccess('Vídeo cadastrado com sucesso');
      }
    });
  }

  onRemoveVideo() async {
    if (widget.videoId == null) return;

    await videoStore.deleteVideo(widget.videoId!);

    if (videoStore.deletedVideoFuture.errorMessage != null) {
      widget.onError('Erro ao deletar vídeo');
    }

    if (videoStore.deletedVideoFuture.data == true &&
        videoStore.deletedVideoFuture.futureState == FutureState.loaded) {
      widget.onSuccess('Vídeo deletado com sucesso');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEditMode = selectedVideo != null;
    if (isEditMode) {
      videoIdController =
          TextEditingController(text: getVideoId(selectedVideo!.url));
      titleController = TextEditingController(text: selectedVideo!.title);
      descriptionController =
          TextEditingController(text: selectedVideo!.description ?? '');
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 36, left: 36, right: 36),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputText(
              label: 'Título:',
              placeholder: 'Ex: A História da programação',
              controller: titleController,
              onChanged: (String? value) {
                setState(() {
                  showPreview = value != null &&
                      value.isNotEmpty &&
                      videoIdController.text.isNotEmpty &&
                      selectedCategory != null;
                });
              },
            ),
            InputText(
              label: 'Video ID:',
              placeholder: 'Ex: N3h5A0oAzsk',
              controller: videoIdController,
              onChanged: (String? value) {
                setState(() {
                  showPreview = value != null &&
                      value.isNotEmpty &&
                      titleController.text.isNotEmpty &&
                      selectedCategory != null;
                });
              },
            ),
            InputDropdown(
              label: 'Categoria:',
              value: selectedCategory?.id,
              onChanged: (String? value) {
                setState(() {
                  selectedCategory = widget.categories.firstWhere(
                    (element) => value != null && element.id == value,
                  );
                  showPreview = videoIdController.text.isNotEmpty &&
                      titleController.text.isNotEmpty &&
                      selectedCategory != null;
                });
              },
              options: widget.categories
                  .map((category) => DropdownMenuItem<String>(
                        value: category.id.toString(),
                        child: Text(category.title),
                      ))
                  .toList(),
            ),
            InputText(
              label: 'Descrição:',
              placeholder: 'Ex: Este vídeo fala sobre...',
              controller: descriptionController,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Preview',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            VideoCard(
              categoryColor: selectedCategory != null
                  ? selectedCategory!.color.toColor()
                  : Colors.amber,
              categoryTitle: selectedCategory?.title ?? '',
              videoUrl: getVideoUrl(videoIdController.text),
              videoTitle: titleController.text,
              isEmpty: !showPreview,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 14),
              child: Button(
                onPressed: isEditMode ? onSaveVideo : onCreateVideo,
                text: isEditMode ? 'Alterar' : 'Cadastrar',
              ),
            ),
            if (isEditMode)
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 14),
                child: Button(
                  background: Theme.of(context).colorScheme.error,
                  onPressed: onRemoveVideo,
                  text: 'Remover',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
