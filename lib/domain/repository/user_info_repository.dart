import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/domain/entities/user_info.dart';

abstract class UserInfoRepository {
  Future<void> createUserInfo(UserInfo user_info, String uid);
  Future<UserInfo?> getUserInfo(String uid);
  Future<void> createPost(String uid, Post post);
  Future<void> resetPost(String uid, List<Post> posts);
  Future<void> deleteUserInfo(String uid);
  Future<void> addBlock(String uid, String target_uid);
}
