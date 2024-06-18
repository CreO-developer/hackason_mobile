import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/domain/repository/score_repository.dart';

final scoreRepository = Provider((ref) => ScoreDataSource());

class ScoreDataSource implements ScoreRepository {
  final Dio dio = Dio();
  @override
  Future<Scores> submitString(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        'http://localhost:8000/mock/question1',
        data: data,
      );
      return Scores.fromJson(response.data);
    } catch (e) {
      print(e);
      return const Scores(
          includeScore: 0,
          excludeScore: 0,
          peopleScore: 0,
          originalScore: 0,
          faceScore: 0);
    }
  }
}
