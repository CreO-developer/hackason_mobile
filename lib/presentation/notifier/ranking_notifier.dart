import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/ranking_service.dart';
import 'package:mobile/application/state/ranking_state.dart';


final rankingNotifierProvider =
    StateNotifierProvider<RankingStateNotifier, RankingState>((ref) {
      final rankingNotifier = RankingStateNotifier(rankingService: ref.read(rankingService));
  return rankingNotifier;
});

class RankingStateNotifier extends StateNotifier<RankingState> {
  RankingStateNotifier({required RankingService rankingService})
      : _rankingService = rankingService,
        super(RankingState(shapes: [], comedian: [], anime: []));

  final RankingService _rankingService;

  Future<RankingState> setRanking(List<String> blocks, String? targetUid) async {
    List<String> modifiableBlocks = List.from(blocks);
    
    if (targetUid != null) {
      modifiableBlocks.add(targetUid);
    }

    final shapePosts = await _rankingService.getRanking('shapes');
    final animePosts = await _rankingService.getRanking('anime');
    final comedianPosts = await _rankingService.getRanking('comedian');

    final filteredShapePosts = shapePosts?['posts']?.where((post) => !modifiableBlocks.contains(post.uid)).toList();
    final filteredAnimePosts = animePosts?['posts']?.where((post) => !modifiableBlocks.contains(post.uid)).toList();
    final filteredComedianPosts = comedianPosts?['posts']?.where((post) => !modifiableBlocks.contains(post.uid)).toList();

    state = state.copyWith(
      shapes: filteredShapePosts ?? state.shapes, 
      anime: filteredAnimePosts ?? state.anime, 
      comedian: filteredComedianPosts ?? state.comedian, 
    );

    return state;
  }
}
