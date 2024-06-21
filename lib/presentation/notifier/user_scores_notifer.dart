import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/score_service.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/scores.dart';

final userScoresNotiferProvider =
    StateNotifierProvider<UserScoresStateNotifier, List<UserScoresState>>(
        (ref) {
  return UserScoresStateNotifier(scoreService: ref.read(scoreService));
});

class UserScoresStateNotifier extends StateNotifier<List<UserScoresState>> {
  UserScoresStateNotifier({required ScoreService scoreService})
      : _scoreService = scoreService,
        super([]); // 初期値として空のリストを設定ト値を設定;

  final ScoreService _scoreService;

  Future submitString(Map<String, dynamic> data) async {
    // filterからbackeendに送るための数値を取得
    late Map<String, dynamic> result;
    int questionNumber = int.parse(data["filter"].split('-')[1]);
    // 現在のを取得
    int questionCount = state.length + 1;
    if (questionCount == 1) {
      result = await _scoreService.submitString1(
          {"imageUrl": data["imgUrl"], "themeNumber": questionNumber});
    } else if (questionCount == 2) {
      result = await _scoreService.submitString2(
          {"imageUrl": data["imgUrl"], "themeNumber": questionNumber});
    } else if (questionCount == 3) {
      result = await _scoreService.submitString3(
          {"imageUrl": data["imgUrl"], "themeNumber": questionNumber});
    } else if (questionCount == 4) {
      result = await _scoreService.submitString4(
          {"imageUrl": data["imgUrl"], "themeNumber": questionNumber});
    }

    state = [
      ...state,
      UserScoresState(
          theme: data["theme"], // `result`から必要なプロパティを取り出す
          filter: data["filter"],
          imgUrl: data['imgUrl'],
          scores: Scores(
              includeScore: result['includeScore'],
              excludeScore: result['excludeScore'],
              peopleScore: result['peopleScore'],
              originalScore: result['originalScore'],
              faceScore: result['faceScore'] ?? 0))
    ];
    return "成功しました";
  }
}
