import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:documentary_flix/utils/dio_helper.dart';
import 'package:documentary_flix/utils/youtube.dart';

class BannerImage extends StatefulWidget {
  final String videoUrl;
  final double height;
  final Widget? child;
  final Alignment? alignment;
  final bool isEmpty;

  const BannerImage({
    super.key,
    this.child,
    this.alignment,
    this.isEmpty = false,
    required this.height,
    required this.videoUrl,
  });

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  ImageProvider image = const AssetImage('assets/images/video-empty.png');
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.isEmpty) {
      final Dio dio = DioHelper.instance;
      String uri = getVideoBannerUrl(widget.videoUrl);

      if (!loaded) {
        () async {
          try {
            Response response = await dio.get(
              uri,
              options: Options(responseType: ResponseType.bytes),
            );
            if (response.statusCode != null &&
                response.statusCode! ~/ 100 == 2 &&
                response.headers["content-type"] != null &&
                response.headers["content-type"].toString().contains("image")) {
              setState(() {
                image = MemoryImage(response.data);
                loaded = true;
              });
            }
          } catch (e) {
            if (mounted) {
              setState(() {
                loaded = true;
              });
            }
          }
        }();
      }
    }

    return Container(
      height: widget.height,
      alignment: widget.alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image,
        ),
      ),
      child: widget.child,
    );
  }
}
