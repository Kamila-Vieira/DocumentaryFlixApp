import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/components/header.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/modules/video/components/form_video.dart';
import 'package:documentary_flix/modules/video/service/repository/video_repository.dart';
import 'package:documentary_flix/modules/video/video_store.dart';

import 'package:documentary_flix/themes/colors.dart';
import 'package:documentary_flix/shared/snackbar_notification.dart';

class VideoPage extends StatelessWidget {
  final String? videoId;
  final List<CategoryModel> categories;

  VideoPage({
    super.key,
    this.videoId,
    required this.categories,
  });

  final VideoStore _videoStore = VideoStore(VideoRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            Padding(
              padding: const EdgeInsets.all(36),
              child: Text(
                videoId != null ? 'Edite o vídeo' : 'Cadastre um vídeo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FormVideo(
              videoId: videoId,
              categories: categories,
              onSuccess: (message) {
                SnackBarNotification.success(context, message);
                Modular.to.navigate(_videoStore.navigateTo);
              },
              onError: (message) {
                SnackBarNotification.error(context, message);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide()),
        backgroundColor: ThemeColors.primaryColor,
        onPressed: () {
          Modular.to.navigate(_videoStore.navigateTo);
        },
        child: const Icon(Icons.home, size: 38, color: ThemeColors.iconColor),
      ),
    );
  }
}
