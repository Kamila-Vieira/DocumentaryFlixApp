import 'package:hive/hive.dart';

part 'video_local.g.dart';

@HiveType(typeId: 3)
class VideoLocal {
  @HiveField(0)
  String url;
  @HiveField(1)
  String title;
  @HiveField(2)
  String categoryId;

  VideoLocal({
    required this.url,
    required this.title,
    required this.categoryId,
  });
}
