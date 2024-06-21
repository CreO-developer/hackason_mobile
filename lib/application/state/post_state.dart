import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/entities/post.dart';

import 'package:mobile/domain/entities/scores.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    required String imgUrl,
    required Scores scores,
    required String filter,
    required String uid,
    required String name,
  }) = _PostState;

  factory PostState.fromPost(Post post, String name) {
    return PostState(
      name: name,
      imgUrl: post.imgUrl,
      scores: post.scores,
      filter: post.filter,
      uid: post.uid,
    );
  }
}
