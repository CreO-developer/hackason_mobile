import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/score_service.dart';
import 'package:mobile/domain/entities/scores.dart';

final scoreNotiferProvider =
    StateNotifierProvider<ScoresStateNotifier, Scores>((ref) {
  return ScoresStateNotifier(scoreService: ref.read(scoreService));
});

class ScoresStateNotifier extends StateNotifier<Scores> {
  ScoresStateNotifier({required ScoreService scoreService})
      : _scoreService = scoreService,
        super(const Scores(
            includeScore: 0,
            excludeScore: 0,
            peopleScore: 0,
            originalScore: 0)); // 初期値としてデフォルト値を設定;

  final ScoreService _scoreService;

  Future<void> submitString(Map<String, dynamic> data) async {
    final result = await _scoreService.submitString(data);
    state = result;
  }
}
