import 'package:hive_flutter/adapters.dart';
import 'package:iapp_flutter_interview_app/persistence/hive_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdPostVO, adapterName: kAdapterNamePostVO)
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

  // copy wit
  PostVO copyWith({int? userId, int? id, String? title, String? body}) {
    return PostVO(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  String getId() {
    return "ID_$id";
  }
}
