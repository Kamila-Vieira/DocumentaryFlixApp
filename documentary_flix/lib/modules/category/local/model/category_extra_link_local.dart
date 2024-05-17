import 'package:hive/hive.dart';

part 'category_extra_link_local.g.dart';

@HiveType(typeId: 1)
class CategoryExtraLinkLocal {
  @HiveField(0)
  String text;
  @HiveField(1)
  String link;

  CategoryExtraLinkLocal({
    required this.text,
    required this.link,
  });
}
