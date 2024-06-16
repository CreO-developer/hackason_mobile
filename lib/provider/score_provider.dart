import 'package:mobile/usecase/score_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/model/scores/scores.dart';

final scoresStateNotifierProvider =
    StateNotifierProvider<ScoresStateNotifier, Scores?>((ref) {
  return ScoresStateNotifier(ScoresUseCase());
});

class ScoresStateNotifier extends StateNotifier<Scores?> {
  final ScoresUseCase _scoresService;

  ScoresStateNotifier(this._scoresService) : super(null);

  Future<void> submitString(String imageUrl) async {
    try {
      state = await _scoresService.fetchScores(imageUrl);
    } catch (e) {
      state = null;
      print('Error occurred: $e');
    }
  }
}
