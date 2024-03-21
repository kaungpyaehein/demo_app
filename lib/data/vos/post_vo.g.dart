// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_vo.dart';

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
