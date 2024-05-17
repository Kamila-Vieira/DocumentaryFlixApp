// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_color_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryColorModel _$CategoryColorModelFromJson(Map<String, dynamic> json) =>
    CategoryColorModel(
      red: (json['R'] as num).toInt(),
      green: (json['G'] as num).toInt(),
      blue: (json['B'] as num).toInt(),
      opacity: (json['O'] as num).toDouble(),
      hexadecimal: json['HEX'] as String,
    );

Map<String, dynamic> _$CategoryColorModelToJson(CategoryColorModel instance) =>
    <String, dynamic>{
      'R': instance.red,
      'G': instance.green,
      'B': instance.blue,
      'O': instance.opacity,
      'HEX': instance.hexadecimal,
    };
