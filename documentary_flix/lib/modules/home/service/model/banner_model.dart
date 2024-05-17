import 'package:json_annotation/json_annotation.dart';
import 'package:documentary_flix/shared/model_base.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel extends ModelBase {
  final String url;
  final String title;
  final String description;

  BannerModel({
    required super.id,
    required this.title,
    required this.description,
    required this.url,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
