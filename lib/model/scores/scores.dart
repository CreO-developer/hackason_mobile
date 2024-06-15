import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'scores.freezed.dart';
part 'scores.g.dart';

@freezed
class Scores with _$Scores {
  const factory Scores({
    required int score1,
    required int score2,
    required int score3,
  }) = _Scores;

  factory Scores.fromJson(Map<String, dynamic> json) => _$ScoresFromJson(json);
}