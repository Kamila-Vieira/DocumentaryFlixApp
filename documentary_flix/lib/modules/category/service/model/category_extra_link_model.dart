import 'package:json_annotation/json_annotation.dart';

part 'category_extra_link_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CategoryExtraLinkModel {
  final String? text, link;

  CategoryExtraLinkModel({
    this.text,
    this.link,
  });

  factory CategoryExtraLinkModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryExtraLinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryExtraLinkModelToJson(this);
}
