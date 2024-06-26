import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/domain/entities/post.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @Default('') String name,
    @Default('') String email,
    @Default([]) List<Post> posts,
    @Default([]) List<String> blocks,
    @Default(true) bool is_show_attention_modal,
  }) = _UserInfo;

  factory UserInfo.fromMap(Map<String, dynamic>? map) {
    return UserInfo(
      name: map?['name'] ?? '',
      email: map?['email'] ?? '',
      posts: (map?['posts'] as List<dynamic>?)?.map((a) {
  return Post.fromMap(a);
}).toList() ?? [],
      blocks: (map?['blocks'] as List<dynamic>?)?.cast<String>() ?? [],
      is_show_attention_modal: map?['isShowAttentionModal'] ?? true,
    );
  }
}
