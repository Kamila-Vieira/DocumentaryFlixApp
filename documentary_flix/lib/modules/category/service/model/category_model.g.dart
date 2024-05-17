// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      color: CategoryColorModel.fromJson(json['color'] as Map<String, dynamic>),
      link: json['link'] as String?,
      description: json['description'] as String?,
      extraLink: json['extra_link'] == null
          ? null
          : CategoryExtraLinkModel.fromJson(
              json['extra_link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('link', instance.link);
  writeNotNull('description', instance.description);
  val['color'] = instance.color;
  writeNotNull('extra_link', instance.extraLink);
  return val;
}
