import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/user_info.dart';
import 'package:mobile/domain/repository/user_info_repository.dart';
import 'package:mobile/infrastracture/datasource/user_info_data_source.dart';

final userInfoService = Provider(
  (ref) => UserInfoService(
    userInfoRepository: ref.read(userInfoRepository),
  ),
);

class UserInfoService {
  UserInfoService({required UserInfoRepository userInfoRepository})
      : _userInfoRepository = userInfoRepository;
  final UserInfoRepository _userInfoRepository;

  Future<void> createUser(UserInfo userInfo, String uid) async {
    final result = await _userInfoRepository.createUserInfo(userInfo, uid);
    return result;
  }
}