import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/entities/scores.dart';

part 'user_score.freezed.dart';

@freezed
class UserScoresState with _$UserScoresState {
  const factory UserScoresState({
    required String imgUrl,
    required String filter,
    required String theme,
    required Scores scores,
  }) = _UserScoresState;
}
