import 'package:mobile/domain/entities/post.dart';

abstract class RankingRepository {
  Future<Map<String, List<Post>>?> getRanking(String theme);
  Future<String?> getName(String uid);
}
