import 'package:json_annotation/json_annotation.dart';

import 'package:documentary_flix/modules/category/service/model/category_color_model.dart';
import 'package:documentary_flix/modules/category/service/model/category_extra_link_model.dart';

import 'package:documentary_flix/shared/model_base.dart';

part 'category_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CategoryModel extends ModelBase {
  final String title;
  final String? link, description;

  final CategoryColorModel color;

  @JsonKey(name: 'extra_link')
  final CategoryExtraLinkModel? extraLink;

  CategoryModel({
    required super.id,
    required this.title,
    required this.color,
    this.link,
    this.description,
    this.extraLink,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
