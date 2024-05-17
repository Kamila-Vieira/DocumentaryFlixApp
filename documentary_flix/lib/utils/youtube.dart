import 'package:url_launcher/url_launcher.dart';

String? getVideoId(String url, {bool trimWhitespaces = true}) {
  if (!url.contains("http") && (url.length == 11)) return url;
  url = url.trim();

  for (var exp in [
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:music\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/shorts\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
  ]) {
    Match? match = exp.firstMatch(url);
    if (match != null && match.groupCount >= 1) return match.group(1);
  }

  return null;
}

String getVideoUrl(String videoId) =>
    'https://www.youtube.com/watch?v=$videoId';

class ThumbnailQuality {
  /// 120*90
  static const String defaultQuality = 'default';

  /// 320*180
  static const String medium = 'mqdefault';

  /// 480*360
  static const String high = 'hqdefault';

  /// 640*480
  static const String standard = 'sddefault';

  /// Unscaled thumbnail
  static const String max = 'maxresdefault';
}

String getVideoBannerUrl(String videoUrl,
    [String quality = ThumbnailQuality.standard]) {
  String? videoId = getVideoId(videoUrl);
  return videoId != null
      ? 'https://i3.ytimg.com/vi_webp/$videoId/$quality.webp'
      : '';
}

Future<void> launchVideo(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}
