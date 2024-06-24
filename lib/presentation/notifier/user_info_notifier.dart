import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/user_info_service.dart';
import 'package:mobile/domain/entities/post.dart';

import '../../domain/entities/user_info.dart';

final userInfoNotifierProvider =
    StateNotifierProvider<UserInfoStateNotifier, UserInfo?>((ref) {
  return UserInfoStateNotifier(userInfoService: ref.read(userInfoService));
});

class UserInfoStateNotifier extends StateNotifier<UserInfo?> {
  UserInfoStateNotifier({required UserInfoService userInfoService})
      : _userInfoService = userInfoService,
        super(UserInfo());

  final UserInfoService _userInfoService;

  void setName(String name) {
    state = state?.copyWith(name: name);
  }

  void setEmail(String email) {
    state = state?.copyWith(email: email);
  }

  Future<void> createUserInfo(String uid) async {
    await _userInfoService.createUser(state!, uid);
  }

  Future<void> setUserInfo(String uid) async {
    final userInfo = await _userInfoService.getUserInfo(uid);
    state = state?.copyWith(
        name: userInfo!.name,
        email: userInfo.email,
        posts: userInfo.posts,
        is_show_attention_modal: userInfo.is_show_attention_modal);
  }

  Future<void> resetPost(String? uid, int? index) async {
    if (index != null &&
        uid != null &&
        index >= 0 &&
        index < state!.posts.length) {
      List<Post> updatedPosts = List.from(state!.posts);
      updatedPosts.removeAt(index);
      state = state!.copyWith(posts: updatedPosts);
      await _userInfoService.resetPost(uid, updatedPosts);
    }
  }
}
