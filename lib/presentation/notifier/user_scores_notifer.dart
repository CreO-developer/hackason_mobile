import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/score_service.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/domain/entities/user_info.dart';
import 'package:mobile/presentation/notifier/auth_user_notifier.dart';
import 'package:mobile/presentation/notifier/user_info_notifier.dart';

final userScoresNotiferProvider =
    StateNotifierProvider<UserScoresStateNotifier, List<UserScoresState>>(
        (ref) {
  // userInfoNotifierProviderの現在の値を取得する
  final authUser =
      ref.watch(authNotifierProvider); // Access the current authenticated user

  return UserScoresStateNotifier(
    scoreService: ref.read(scoreService),

    authUser: authUser, // Pass the user to the notifier
  );
});

class UserScoresStateNotifier extends StateNotifier<List<UserScoresState>> {
  UserScoresStateNotifier(
      {required ScoreService scoreService, required User? authUser})
      : _scoreService = scoreService,
        _authUser = authUser,
        super([]);

  final ScoreService _scoreService;
  final User? _authUser;

  void resetScores() {
    state = [];
  }

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

  Future<String> scorePost(String imgUrl) async {
    print(imgUrl);
    print(_authUser!.uid);
    // Use firstWhereOrNull to find a matching UserScoresState or return null
    UserScoresState? matchingScore =
        state.firstWhereOrNull((userScore) => userScore.imgUrl == imgUrl);

    if (matchingScore != null) {
      // If a matching score is found

      return "一致するスコアが見つかりました: ${matchingScore.scores.includeScore}";
    } else {
      // If no matching score is found

      return "一致するスコアが見つかりませんでした";
    }
  }
}
