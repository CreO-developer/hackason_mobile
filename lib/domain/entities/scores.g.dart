// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoresImpl _$$ScoresImplFromJson(Map<String, dynamic> json) => _$ScoresImpl(
      includeScore: (json['includeScore'] as num).toInt(),
      excludeScore: (json['excludeScore'] as num).toInt(),
      peopleScore: (json['peopleScore'] as num).toInt(),
      originalScore: (json['originalScore'] as num).toInt(),
      faceScore: (json['faceScore'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ScoresImplToJson(_$ScoresImpl instance) =>
    <String, dynamic>{
      'includeScore': instance.includeScore,
      'excludeScore': instance.excludeScore,
      'peopleScore': instance.peopleScore,
      'originalScore': instance.originalScore,
      'faceScore': instance.faceScore,
    };
