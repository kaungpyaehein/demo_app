// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostVOAdapter extends TypeAdapter<PostVO> {
  @override
  final int typeId = 0;

  @override
  PostVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostVO(
      userId: fields[0] as int?,
      id: fields[1] as int?,
      title: fields[2] as String?,
      body: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PostVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostVO _$PostVOFromJson(Map<String, dynamic> json) => PostVO(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$PostVOToJson(PostVO instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
