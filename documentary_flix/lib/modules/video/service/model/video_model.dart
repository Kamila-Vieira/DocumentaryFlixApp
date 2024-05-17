import 'package:json_annotation/json_annotation.dart';
import 'package:documentary_flix/shared/model_base.dart';

part 'video_model.g.dart';

@JsonSerializable(includeIfNull: false)
class VideoModel extends ModelBase {
  final String url;
  final String title;
  final String categoryId;
  final String? description;

  VideoModel({
    required super.id,
    required this.title,
    required this.categoryId,
    required this.url,
    this.description,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
