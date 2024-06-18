import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}
