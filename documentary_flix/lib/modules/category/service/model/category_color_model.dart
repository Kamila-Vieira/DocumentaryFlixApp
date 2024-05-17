import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:documentary_flix/utils/color.dart';

part 'category_color_model.g.dart';

@JsonSerializable()
class CategoryColorModel extends ColorUtils {
  @JsonKey(name: 'R')
  final int red;
  @JsonKey(name: 'G')
  final int green;
  @JsonKey(name: 'B')
  final int blue;
  @JsonKey(name: 'O')
  final double opacity;
  @JsonKey(name: 'HEX')
  final String hexadecimal;

  CategoryColorModel({
    required this.red,
    required this.green,
    required this.blue,
    required this.opacity,
    required this.hexadecimal,
  });

  factory CategoryColorModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryColorModelToJson(this);

  Color fromHex() => ColorUtils.fromHex(hexadecimal);

  String toHex([bool? leadingHashSign = false]) =>
      ColorUtils.toHex(toJson(), leadingHashSign: leadingHashSign ?? false);

  Color toColor() => ColorUtils.toColor(toJson());
}
