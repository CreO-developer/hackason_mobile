import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/domain/repository/ranking_repository.dart';
import 'package:mobile/infrastracture/datasource/ranking_data_source.dart';

final rankingService = Provider(
  (ref) => RankingService(
    rankingRepository: ref.read(rankingRepository),
  ),
);

class RankingService {
  RankingService({required RankingRepository rankingRepository})
      : _rankingRepository = rankingRepository;
  final RankingRepository _rankingRepository;

  Future<Map<String, List<Post>>?> getRanking(String theme) async {
    final result = await _rankingRepository.getRanking(theme);
    return result;
  }

  Future<String?> getName(String uid) async {
    final name = await _rankingRepository.getName(uid);
    return name;
  }
}
