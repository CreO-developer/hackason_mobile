import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @Default('') String name,
    @Default('') String email,
    @Default([]) List posts,
    @Default(true) bool is_show_attention_modal,
  }) = _UserInfo;
}
