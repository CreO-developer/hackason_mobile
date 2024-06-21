import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/ranking_service.dart';
import 'package:mobile/application/state/ranking_state.dart';
import 'package:mobile/domain/entities/post.dart';


final rankingNotifierProvider =
    StateNotifierProvider<RankingStateNotifier, RankingState>((ref) {
      final rankingNotifier = RankingStateNotifier(rankingService: ref.read(rankingService));
      rankingNotifier.initialize();
  return rankingNotifier;
});

class RankingStateNotifier extends StateNotifier<RankingState> {
  RankingStateNotifier({required RankingService rankingService})
      : _rankingService = rankingService,
        super(RankingState(shapes: [], comedian: [], anime: []));

  final RankingService _rankingService;

  Future<void> initialize() async {
      setRanking();
  }

  Future<RankingState> setRanking() async {

    final shapePosts = await _rankingService.getRanking('shapes');
    final animePosts = await _rankingService.getRanking('anime');
    final comedianPosts = await _rankingService.getRanking('comedian');

    state = state.copyWith(
      shapes: shapePosts?['posts'] ?? state.shapes, 
      anime: animePosts?['posts'] ?? state.anime, 
      comedian: comedianPosts?['posts'] ?? state.comedian, 
    );

    return state;
  }
}
