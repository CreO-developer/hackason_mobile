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
    if (userInfo != null) {
    state = state?.copyWith(
        name: userInfo.name,
        email: userInfo.email,
        posts: userInfo.posts,
        blocks: userInfo.blocks,
        is_show_attention_modal: userInfo.is_show_attention_modal);
    }
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

  Future<void> deleteUserInfo(String? uid) async {
    if ( uid != null ) {
      final userInfo = UserInfo();
      state = state?.copyWith(
        name: userInfo.name,
        email: userInfo.email,
        posts: userInfo.posts,
        blocks: userInfo.blocks,
        is_show_attention_modal: userInfo.is_show_attention_modal);
      await _userInfoService.deleteUserInfo(uid);
    }
  }

  Future<void> addBlock(String uid, String target_uid) async {
    await _userInfoService.addBlock(uid, target_uid); // ブロックの追加処理を非同期で実行

    // 現在の状態を取得
    final currentState = state;
    if (currentState != null) {
      print(currentState.blocks); // 現在のブロックリストを出力

      // 新しいブロックリストを作成し、uid を追加する
      final updatedBlocks = List<String>.from(currentState.blocks);
      updatedBlocks.add(uid);

      // 状態を更新する
      state = currentState.copyWith(blocks: updatedBlocks);
    }
  }
}
