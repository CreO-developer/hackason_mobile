// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      imgUrl: json['imgUrl'] as String,
      scores: Scores.fromJson(json['scores'] as Map<String, dynamic>),
      filter: json['filter'] as String,
      uid: json['uid'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
      'scores': instance.scores.toJson(),
      'filter': instance.filter,
      'uid': instance.uid,
      'name': instance.name,
    };
