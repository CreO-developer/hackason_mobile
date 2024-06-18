import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/domain/repository/score_repository.dart';
import 'package:mobile/infrastracture/datasource/score_data_souce.dart';

final scoreService = Provider(
  (ref) => ScoreService(
    scoreRepository: ref.read(scoreRepository),
  ),
);

class ScoreService {
  ScoreService({required ScoreRepository scoreRepository})
      : _scoreRepository = scoreRepository;
  final ScoreRepository _scoreRepository;

  Future<Scores> submitString(Map<String, dynamic> data) async {
    final result = await _scoreRepository.submitString(data);
    return result;
  }
}
