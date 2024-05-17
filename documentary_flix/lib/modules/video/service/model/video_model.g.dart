// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      categoryId: json['categoryId'] as String,
      url: json['url'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'url': instance.url,
    'title': instance.title,
    'categoryId': instance.categoryId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
