import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/ranking_service.dart';
import 'package:mobile/application/state/ranking.dart';


final rankingNotifierProvider =
    StateNotifierProvider<RankingStateNotifier, Ranking>((ref) {
      final rankingNotifier = RankingStateNotifier(rankingService: ref.read(rankingService));
      rankingNotifier.initialize();
  return rankingNotifier;
});

class RankingStateNotifier extends StateNotifier<Ranking> {
  RankingStateNotifier({required RankingService rankingService})
      : _rankingService = rankingService,
        super(Ranking(shapes: [], comedian: [], anime: []));

  final RankingService _rankingService;

  Future<void> initialize() async {
      getRanking();
  }

  Future<Ranking> getRanking() async {

    final shapes = await _rankingService.getRanking('shapes');
    final anime = await _rankingService.getRanking('anime');
    final comedian = await _rankingService.getRanking('comedian');
    state = state.copyWith(
      shapes: shapes?['posts'] ?? state.shapes, 
      anime: anime?['posts'] ?? state.anime, 
      comedian: comedian?['posts'] ?? state.comedian, 
    );

    return state;
  }
}
