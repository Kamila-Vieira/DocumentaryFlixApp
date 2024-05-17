// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_extra_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryExtraLinkModel _$CategoryExtraLinkModelFromJson(
        Map<String, dynamic> json) =>
    CategoryExtraLinkModel(
      text: json['text'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CategoryExtraLinkModelToJson(
    CategoryExtraLinkModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('link', instance.link);
  return val;
}
