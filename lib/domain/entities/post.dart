import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mobile/domain/entities/scores.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(explicitToJson: true)
  const factory Post({
    required String imgUrl,
    required Scores scores,
    required String filter,
    required String uid,
    required String name,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      imgUrl: map['imgUrl'] ?? '',
      scores: Scores.fromMap(map['scores'] ?? {}),
      filter: map['filter'] ?? '',
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
