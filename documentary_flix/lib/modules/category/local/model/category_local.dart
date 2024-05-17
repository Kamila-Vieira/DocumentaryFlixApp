import 'package:hive/hive.dart';

part 'category_local.g.dart';

@HiveType(typeId: 2)
class CategoryLocal {
  @HiveField(0)
  int red;
  @HiveField(1)
  int green;
  @HiveField(2)
  int blue;
  @HiveField(3)
  double opacity;
  @HiveField(4)
  String hexadecimal;

  CategoryLocal({
    required this.red,
    required this.green,
    required this.blue,
    required this.opacity,
    required this.hexadecimal,
  });
}
