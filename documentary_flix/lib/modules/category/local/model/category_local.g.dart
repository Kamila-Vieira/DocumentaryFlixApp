// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryLocalAdapter extends TypeAdapter<CategoryLocal> {
  @override
  final int typeId = 2;

  @override
  CategoryLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryLocal(
      red: fields[0] as int,
      green: fields[1] as int,
      blue: fields[2] as int,
      opacity: fields[3] as double,
      hexadecimal: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryLocal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.red)
      ..writeByte(1)
      ..write(obj.green)
      ..writeByte(2)
      ..write(obj.blue)
      ..writeByte(3)
      ..write(obj.opacity)
      ..writeByte(4)
      ..write(obj.hexadecimal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
