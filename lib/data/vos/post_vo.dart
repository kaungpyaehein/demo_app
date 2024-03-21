import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_vo.g.dart';

@JsonSerializable()
// @HiveType(typeId: kHiveTypeUserVO, adapterName: kAdapterNameUserVO)
class PostVO {
  @JsonKey(name: "userId")
  @HiveField(0)
  int? userId;

  @JsonKey(name: "id")
  @HiveField(1)
  int? id;

  @JsonKey(name: "title")
  @HiveField(2)
  String? title;

  @JsonKey(name: "body")
  @HiveField(3)
  String? body;

  PostVO({this.userId, this.id, this.title, this.body});

  //from json
  factory PostVO.fromJson(Map<String, dynamic> json) => _$PostVOFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PostVOToJson(this);

  String getId() {
    return "ID_$id";
  }
}
