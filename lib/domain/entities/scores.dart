import 'package:freezed_annotation/freezed_annotation.dart';

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
  Map<String, dynamic> toJson() {
    return {
      'includeScore': includeScore,
      'excludeScore': excludeScore,
      'peopleScore': peopleScore,
      'originalScore': originalScore,
      'faceScore': faceScore,
    };
  }

  factory Scores.fromMap(Map<String, dynamic> map) {
    return Scores(
      faceScore: (map['faceScore'] ?? 0),
      excludeScore: (map['excludeScore'] ?? 0),
      peopleScore: (map['peopleScore'] ?? 0),
      includeScore: (map['includeScore'] ?? 0),
      originalScore: (map['originalScore'] ?? 0),
    );
  }
}
