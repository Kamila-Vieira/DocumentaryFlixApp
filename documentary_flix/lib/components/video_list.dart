import 'package:flutter/material.dart';
import 'package:documentary_flix/components/video_card.dart';

class VideoList extends StatelessWidget {
  final List<VideoCard> videoCards;
  const VideoList(this.videoCards, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        itemCount: videoCards.length,
        itemBuilder: (BuildContext context, int index) => videoCards[index],
      ),
    );
  }
}
