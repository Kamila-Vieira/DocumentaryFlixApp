// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_extra_link_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryExtraLinkLocalAdapter
    extends TypeAdapter<CategoryExtraLinkLocal> {
  @override
  final int typeId = 1;

  @override
  CategoryExtraLinkLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryExtraLinkLocal(
      text: fields[0] as String,
      link: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryExtraLinkLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryExtraLinkLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
