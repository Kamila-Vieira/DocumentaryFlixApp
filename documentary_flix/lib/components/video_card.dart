import 'package:flutter/material.dart';

import 'package:documentary_flix/components/widgets/button.dart';
import 'package:documentary_flix/components/banner_image.dart';
import 'package:documentary_flix/components/tag_filter.dart';

import 'package:documentary_flix/utils/youtube.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl;
  final String videoTitle;
  final String categoryTitle;
  final Color categoryColor;
  final bool isEmpty;
  final Function()? onEditVideo;
  final Function()? onCategoryPress;

  const VideoCard({
    super.key,
    this.isEmpty = false,
    this.onEditVideo,
    this.onCategoryPress,
    required this.videoTitle,
    required this.videoUrl,
    required this.categoryTitle,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isEmpty)
              TagFilter(
                title: categoryTitle,
                color: categoryColor,
                onPressed: onCategoryPress,
              ),
            if (onEditVideo != null)
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEditVideo,
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 18),
          child: Stack(
            children: [
              BannerImage(
                isEmpty: isEmpty,
                videoUrl: videoUrl,
                alignment: !isEmpty ? Alignment.bottomRight : null,
                height: 180,
                child: !isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8, right: 8),
                        child: Button(
                          text: 'Acessar',
                          onPressed: () => launchVideo(videoUrl),
                        ),
                      )
                    : null,
              ),
              if (videoTitle.isNotEmpty && !isEmpty)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(videoTitle!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
