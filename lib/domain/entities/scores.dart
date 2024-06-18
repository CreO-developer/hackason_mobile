import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'scores.freezed.dart';
part 'scores.g.dart';

@freezed
class Scores with _$Scores {
  const factory Scores({
    required int includeScore,
    required int excludeScore,
    required int peopleScore,
    required int originalScore,
    int? faceScore,
  }) = _Scores;

  factory Scores.fromJson(Map<String, dynamic> json) => _$ScoresFromJson(json);
}
