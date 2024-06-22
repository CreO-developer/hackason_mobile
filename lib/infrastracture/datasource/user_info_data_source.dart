import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/domain/entities/user_info.dart';
import 'package:mobile/domain/repository/user_info_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userInfoRepository = Provider((ref) => UserInfoDataSource());

class UserInfoDataSource implements UserInfoRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> createUserInfo(UserInfo userInfo, String uid) async {
    try {
      final user_info = await db.collection('users').doc(uid).set({
        'name': userInfo.name,
        'email': userInfo.email,
        'posts': userInfo.posts,
        'isShowAttentionModal': userInfo.is_show_attention_modal,
      });
      return user_info;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserInfo?> getUserInfo(String uid) async {
    try {
      final result = await db.collection('users').doc(uid).get();
      final userInfo = UserInfo.fromMap(result.data());
      return userInfo;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> createPost(String uid, Post post) async {
    try {
      final result = await db.collection('users').doc(uid).update({
        'posts': FieldValue.arrayUnion([post]),
      });
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
