import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/user_info_service.dart';

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
}
