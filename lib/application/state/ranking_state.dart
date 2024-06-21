import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/entities/post.dart';

part 'ranking_state.freezed.dart';

@freezed
class RankingState with _$RankingState {
  const factory RankingState({
    required List<Post> shapes,
    required List<Post> comedian,
    required List<Post> anime,
  }) = _RankingState;
}
