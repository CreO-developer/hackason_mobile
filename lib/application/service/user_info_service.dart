import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/post.dart';
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

  Future<UserInfo?> getUserInfo(String uid) async {
    final userInfo = await _userInfoRepository.getUserInfo(uid);
    return userInfo;
  }

  Future<void> createPost(String uid, UserScoresState userStateScore) async {
    final post = Post(
      name: userStateScore.theme,
      filter: userStateScore.filter,
      imgUrl: userStateScore.imgUrl,
      scores: userStateScore.scores,
      uid: uid,
    );
    final result = await _userInfoRepository.createPost(uid, post);
    return result;
  }
}
