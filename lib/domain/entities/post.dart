import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mobile/domain/entities/scores.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String imgUrl,
    required Scores scores,
    required String filter,
    required String uid,
  }) = _Post;

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      imgUrl: map['imgUrl'] ?? '',
      scores: Scores.fromMap(map['scores'] ?? {}),
      filter: map['filter'] ?? '',
      uid: map['uid'] ?? '',
    );
  }
}
