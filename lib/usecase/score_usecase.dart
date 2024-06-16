import 'package:mobile/repository/fastapi/score_repository.dart';
import 'package:mobile/model/scores/scores.dart';
import 'package:dio/dio.dart';

class ScoresUseCase {
  late final ApiClient _apiClient;

  ScoresUseCase() {
    Dio dio = Dio(); // Dioインスタンスの作成
    _apiClient = ApiClient(dio); // ApiClientの初期化
  }

  Future<Scores> fetchScores(String imageUrl) async {
    try {
      // 入力文字列をMapにラップ
      final requestBody = {'imageUrl': imageUrl, 'themeNumber': 1};
      return await _apiClient.submitString(requestBody);
    } catch (e) {
      throw Exception('Failed to fetch scores: $e');
    }
  }
}
