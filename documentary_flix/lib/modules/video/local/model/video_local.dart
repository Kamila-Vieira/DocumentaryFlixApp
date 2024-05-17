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
  @HiveField(3)
  String? description;

  VideoLocal({
    required this.url,
    required this.title,
    required this.categoryId,
    this.description,
  });
}
