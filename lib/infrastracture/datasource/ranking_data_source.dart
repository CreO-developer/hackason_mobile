import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/domain/repository/ranking_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final rankingRepository = Provider((ref) => RankingDataSource());

class RankingDataSource implements RankingRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<Map<String, List<Post>>?> getRanking(String theme) async {
    try {
      final ranking = await db.collection('ranking').doc(theme).get();
      final data = ranking.data();

      if (data == null) {
        return null;
      }

      Map<String, List<Post>> result = {};
      data.forEach((key, value) {
        if (value is List) {
          result[key] = value.map((item) => Post.fromMap(item)).toList();
        }
      });

      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
