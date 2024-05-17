// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoLocalAdapter extends TypeAdapter<VideoLocal> {
  @override
  final int typeId = 3;

  @override
  VideoLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoLocal(
      url: fields[0] as String,
      title: fields[1] as String,
      categoryId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VideoLocal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
