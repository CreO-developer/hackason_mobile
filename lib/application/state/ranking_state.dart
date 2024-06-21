import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/application/state/post_state.dart';

part 'ranking_state.freezed.dart';

@freezed
class RankingState with _$RankingState {
  const factory RankingState({
    required List<PostState> shapes,
    required List<PostState> comedian,
    required List<PostState> anime,
  }) = _RankingState;
}
