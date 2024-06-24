import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        'blocks': userInfo.blocks,
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
        'posts': FieldValue.arrayUnion([post.toJson()]),
      });
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> resetPost(String uid, List<Post> posts) async {
    try {
      final result = await db.collection('users').doc(uid).update({
        'posts': posts,
      });
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> deleteUserInfo(String uid) async {
    try {
      final result = await db.collection('users').doc(uid).delete();
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> addBlock(String uid, String target_uid) async {
    try {
      final result = await db.collection('users').doc(uid).update({
        'blocks': FieldValue.arrayUnion([target_uid]),
      });
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
