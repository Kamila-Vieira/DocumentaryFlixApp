import 'package:flutter/material.dart';

import 'package:documentary_flix/components/banner_image.dart';
import 'package:documentary_flix/components/widgets/button.dart';

import 'package:documentary_flix/utils/youtube.dart';

class BannerHighlight extends StatelessWidget {
  final String videoUrl;
  const BannerHighlight({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return BannerImage(
      videoUrl: videoUrl,
      alignment: Alignment.bottomCenter,
      height: 138,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: Button(
          onPressed: () => launchVideo(videoUrl),
          text: 'Assista agora',
        ),
      ),
    );
  }
}
