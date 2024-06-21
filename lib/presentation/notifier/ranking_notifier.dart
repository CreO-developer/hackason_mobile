import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/ranking_service.dart';
import 'package:mobile/application/state/post_state.dart';
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

    final List<PostState> shapePostStates = await convertPostsToPostStates(shapePosts!['posts']?? []);
    final List<PostState> animePostStates = await convertPostsToPostStates(animePosts!['posts']?? []);
    final List<PostState> comedianPostStates = await convertPostsToPostStates(comedianPosts!['posts']?? []);

    state = state.copyWith(
      shapes: shapePostStates ?? state.shapes, 
      anime: animePostStates ?? state.anime, 
      comedian: comedianPostStates ?? state.comedian, 
    );

    return state;
  }

  Future<List<PostState>> convertPostsToPostStates(List<Post> posts) async {
    final postStates = posts.map((post) async {
      final name = await _rankingService.getName(post.uid);
      return PostState.fromPost(post, name ?? '');
    }).toList();

    return await Future.wait(postStates);
  }

}
